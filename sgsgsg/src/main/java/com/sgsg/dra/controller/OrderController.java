package com.sgsg.dra.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.OrderService;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService orderService;

	@RequestMapping("payment")
	public String orderMain(HttpSession session) {
		
		//SessionInfo info = (SessionInfo)session.getAttribute("member");
		
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
