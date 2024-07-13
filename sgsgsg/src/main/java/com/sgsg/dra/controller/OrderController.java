package com.sgsg.dra.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.Product;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.OrderService;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService orderService;

	@RequestMapping("payment")
	public String orderMain(
			@RequestParam List<Long> stockNum,
			@RequestParam List<Integer> qty,
			@RequestParam(defaultValue = "buy") String mode,
			HttpSession session,
			Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info == null) {
			return ".member.login";
		}
		
		try {
			Delivery delivery = orderService.findByDest(info.getUserId());
			long orderNum = orderService.productOrderNum();
			int totalProduct = 0; // 상품합
			int deliveryCharge = 0; // 배송비
			int totalPayment = 0;  // 결제할 금액(상품합 + 배송비)
			int totalSavedMoney = 0; // 적립금 총합
			int totalDiscountPrice = 0; // 총 할인액
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("orderNum", orderNum);
			map.put("userId", info.getUserId());
			map.put("stockNum", stockNum);
			map.put("mode", mode);
			
			
			List<Product> productList = orderService.findByStockNum(map);
			//Order order = orderService.
			
			for (int i = 0; i < productList.size(); i++) {
				Product dto = productList.get(i);
				int productSum = dto.getPrice() * qty.get(i);
				
				dto.setQty(qty.get(i));
				dto.setSalePrice((int) Math.ceil(dto.getPrice() * (1-dto.getDiscountRate()/100.0)));
				
				totalSavedMoney += (qty.get(i) * dto.getSavedMoney());
				dto.setSavedMoney(qty.get(i) * dto.getSavedMoney());
				
				totalProduct += productSum;
				totalDiscountPrice += productSum - dto.getSalePrice() * qty.get(i);
				deliveryCharge += dto.getDelivery();
				
			}
			
			deliveryCharge = totalProduct >= 200000 ? 0 : deliveryCharge;
			totalPayment = totalProduct - totalDiscountPrice + deliveryCharge;
			
			model.addAttribute("defaultDest", delivery);
			model.addAttribute("productList", productList);
			model.addAttribute("orderNum", orderNum);
			model.addAttribute("deliveryCharge", deliveryCharge);
			model.addAttribute("totalProduct", totalProduct);
			model.addAttribute("totalPayment", totalPayment);
			model.addAttribute("totalSavedMoney", totalSavedMoney);
			model.addAttribute("totalDiscountPrice", totalDiscountPrice);
			
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".order.order";
	}
	
	@PostMapping("paymentOk")
	public String paymentSubmit(Order dto, HttpSession session) {
		try {
			
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			dto.setUserId(info.getUserId());
			
			orderService.insertOrder(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return "redirect:/";
		return "/";
	}
			
}
