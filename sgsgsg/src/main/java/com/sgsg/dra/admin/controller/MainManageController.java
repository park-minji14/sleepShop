package com.sgsg.dra.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.admin.domain.RecentOrderManage;
import com.sgsg.dra.admin.service.ChartManageService;
import com.sgsg.dra.admin.service.OrderManageService;
import com.sgsg.dra.domain.Order;

@Controller
public class MainManageController {
	
	@Autowired
	OrderManageService orderService;
	
	@Autowired
	ChartManageService chartService;
	 
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminMain(Model model) {
		
		try {
			List<Order> stateCountList = orderService.selectOrderStateCount();
			List<RecentOrderManage> recentOrder = chartService.recentOrder();
			
			model.addAttribute("stateCountList", stateCountList);
			model.addAttribute("recentOrder", recentOrder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".adminLayout";
	}
	
	
	@RequestMapping(value="/adminManagement", method=RequestMethod.GET)
	public String adminSideLayout() {
        
		return ".adminManagement";
	}
	
	@GetMapping(value="/adminManagement/charts")
	@ResponseBody
	public Map<String, Object> chartThing(){
		
		List<Map<String, Object>> todayOrder = chartService.todayOrder();
		List<Map<String, Object>> todayDelivery = chartService.todayDelivery();
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("todayOrder", todayOrder);
		model.put("todayDelivery", todayDelivery);
		
		
		return model;
	}
	
}