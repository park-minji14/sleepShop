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
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("stockNum", stockNum);
			
			List<Product> productList = orderService.findByStockNum(map);
			//Order order = orderService.
			
			for (int i = 0; i < productList.size(); i++) {
				Product dto = productList.get(i);
				
				dto.setQty(qty.get(i));
			}
			
			model.addAttribute("defaultDest", delivery);
			model.addAttribute("productList", productList);
				
			
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
