package com.sgsg.dra.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sgsg.dra.admin.service.OrderManageService;
import com.sgsg.dra.domain.Order;

@Controller
@RequestMapping("adminManagement/orderManage/*")
public class OrderManageController {
	
	@Autowired
	private OrderManageService service;
	
	@RequestMapping("order")
	public String orderManage(Model model) throws Exception {
		try {
			List<Order> orderList = service.listOrder();
			
			model.addAttribute("orderList", orderList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ".adminLeft.order.order";
	}
	
	@GetMapping("order/detail")
	public String detail(
			@RequestParam String orderNum,
			Model model) throws Exception{
		
		Order order = service.findById(orderNum);
		List<Order> listDetail = service.findByOrderDetails(orderNum);
		
		model.addAttribute("order", order);
		model.addAttribute("listDetail", listDetail);
		
		return ".adminLeft.order.detail";
	}
	
	
	
	@RequestMapping("delivery")
	public String deliveryManage(Model model) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ".adminLeft.order.delivery";
	}
}
