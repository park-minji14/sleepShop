package com.sgsg.dra.admin.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.admin.service.OrderManageService;
import com.sgsg.dra.domain.Order;

@Controller
@RequestMapping("adminManagement/orderManage/*")
public class OrderManageController {
	
	@Autowired
	private OrderManageService service;
	
	@RequestMapping("order")
	public String orderManage(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "orderNum") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		try {
			int size = 10;
			int total_page;
			int dataCount;
			
			if (req.getMethod().equalsIgnoreCase("GET")) {
				kwd = URLDecoder.decode(kwd, "UTF-8");
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			
			List<Order> orderList = service.listOrder(map);
			
			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
			
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
		List<Order> deliveryCompanyList = service.selectDeliveryCompanyList();
		
		model.addAttribute("order", order);
		model.addAttribute("listDetail", listDetail);
		model.addAttribute("deliveryCompanyList", deliveryCompanyList);
		
		return ".adminLeft.order.detail";
	}
	
	@GetMapping("order/deliveryList")
	@ResponseBody
	public Map<String, Object> selectDeliveryCompanyList() throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		String state = "false";
		 
		try {
			List<Order> list = service.selectDeliveryCompanyList();
			state = "true";
			map.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("state", state);
		
		return map;
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
