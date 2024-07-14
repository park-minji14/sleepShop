package com.sgsg.dra.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgsg.dra.admin.service.OrderManageService;
import com.sgsg.dra.domain.Order;

@Controller
@RequestMapping("adminManagement/orderManage/*")
public class OrderManageController {
	
	@Autowired
	private OrderManageService service;
	
	@RequestMapping("main")
	public String productManage(Model model) throws Exception {
		try {
			List<Order> orderList = service.listOrder();
			
			model.addAttribute("orderList", orderList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ".adminLeft.order.main";
	}
}
