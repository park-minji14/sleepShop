package com.sgsg.dra.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Member;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.Product;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.domain.UserPoint;
import com.sgsg.dra.service.CartService;
import com.sgsg.dra.service.OrderService;
import com.sgsg.dra.state.OrderState;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;

	@RequestMapping("payment")
	public String orderMain(
			@RequestParam List<Long> stockNum,
			@RequestParam List<Integer> qty,
			@RequestParam(defaultValue = "buy") String mode,
			HttpSession session,
			RedirectAttributes reAttr,
			Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info == null) {
			return ".member.login";
		}
		
		try {
			Member orderUser = orderService.findByOrderUser(info.getUserId());
			Delivery delivery = orderService.findByDest(info.getUserId());
			String orderNum = orderService.productOrderNumber();
			
			String productOrderName = "";
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
			
			// 상품 정보 찾기
			List<Product> productList = orderService.findByStockNum(map);
			
			
			// 마지막 포인트 내역
			UserPoint userPoint = orderService.findByUserPoint(info.getUserId());
			
			for (int i = 0; i < productList.size(); i++) {
				Product dto = productList.get(i);
				// 재고 개수보다 크면 재고 개수로.
				int qtyTemp = qty.get(i) > dto.getTotalStock()? dto.getTotalStock():qty.get(i);
				
				int productSum = dto.getPrice() * qtyTemp;
				
				dto.setQty(qtyTemp);
				// 할인된 가격 계산
                double discountedPrice = dto.getPrice() * (1 - dto.getDiscountRate() / 100.0);
                // 백원 단위로 반올림
                long roundedPrice = Math.round(discountedPrice / 100.0) * 100;
                dto.setSalePrice(roundedPrice);
				
				totalSavedMoney += (qtyTemp * dto.getSavedMoney());
				dto.setSavedMoney(qtyTemp * dto.getSavedMoney());
				
				totalProduct += productSum;
				totalDiscountPrice += productSum - dto.getSalePrice() * qtyTemp;
				deliveryCharge += dto.getDelivery();
				
			}
			// 재고 0인 상품은 리스트에서 삭제
			productList.removeIf(n -> n.getTotalStock() ==0);
			if (productList.size() == 0) {
				StringBuilder sb = new StringBuilder();
				sb.append("주문하신 상품은 품절 상태입니다.<br>");
				sb.append("상품이 재입고되는 대로 신속하게 처리해 드릴 예정입니다.<br>");
				sb.append("불편을 드려 대단히 죄송합니다.");

				reAttr.addFlashAttribute("title", "품절 안내");
				reAttr.addFlashAttribute("message", sb.toString());
				
				return "redirect:/order/complete";
			}
			
			productOrderName = productList.get(0).getProductName();
			if(productList.size() > 1) {
				productOrderName += " 외 " + (productList.size() - 1) + "건";
			}
			
			deliveryCharge = totalProduct >= 200000 ? 0 : deliveryCharge;
			totalPayment = totalProduct - totalDiscountPrice + deliveryCharge;
			
			model.addAttribute("orderUser", orderUser);
			model.addAttribute("defaultDest", delivery);
			model.addAttribute("productList", productList);
			model.addAttribute("productOrderName", productOrderName);
			model.addAttribute("orderNum", orderNum);
			model.addAttribute("deliveryCharge", deliveryCharge);
			model.addAttribute("totalProduct", totalProduct);
			model.addAttribute("totalPayment", totalPayment);
			model.addAttribute("totalSavedMoney", totalSavedMoney);
			model.addAttribute("totalDiscountPrice", totalDiscountPrice);
			model.addAttribute("mode", mode);
			model.addAttribute("userPoint", userPoint);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".order.order";
	}
	
	@PostMapping("paymentOk")
	public String paymentSubmit(Order order,
			Delivery delivery,
			@RequestParam(defaultValue = "buy") String mode,
			RedirectAttributes reAttr,
			HttpSession session) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");

		try {
			
			order.setUserId(info.getUserId());
			order.setOrderState(OrderState.PAYMENT_COMPLETED.ordinal());
			
			delivery.setUserId(info.getUserId());
			
			orderService.insertOrder(order);
			
			if(mode.equals("cart") || mode.equals("item")) {
				// 구매 상품에 대한 장바구니 비우기
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("gubun", "list");
				map.put("userId", info.getUserId());
				map.put("stockNum", order.getStockNums());
				
				cartService.deleteCart(map);
			}
			
			orderService.upsert(delivery);
			
			String p = String.format("%,d", order.getPayment());
			
			StringBuilder sb = new StringBuilder();
			sb.append(info.getUserName() + "님 상품을 구매해 주셔서 감사 합니다.<br>");
			sb.append("구매 하신 상품의 결제가 정상적으로 처리되었습니다.<br>");
			sb.append("결제 금액 : <label class='fs-5 fw-bold text-primary'>" +  p + "</label>원");

			reAttr.addFlashAttribute("title", "상품 결제 완료");
			reAttr.addFlashAttribute("message", sb.toString());
			
			return "redirect:/order/complete";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	@GetMapping("complete")
	public String complete(@ModelAttribute("title") String title, 
			@ModelAttribute("message") String message
			) throws Exception {
		// F5를 누른 경우
		if (message == null || message.length() == 0) { 
			return "redirect:/";
		}
		
		return ".order.complete";
	}
	
	@GetMapping("allDest")
	public String selectAllDest(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			List<Delivery> deliveries = orderService.selectAllDest(info.getUserId());
			model.addAttribute("deliveries", deliveries);
		} catch (Exception e) {
		}
		
		return "order/destList";
	}
	
	@PostMapping("deleteDest")
	@ResponseBody
	public Map<String, Object> deleteDest(Long destinationNum, HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "false";

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", info.getUserId());
			map.put("destinationNum", destinationNum);
			
			orderService.deleteDest(map);
			
			state = "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("state", state);
		
		return model;
	}
	
	
}
