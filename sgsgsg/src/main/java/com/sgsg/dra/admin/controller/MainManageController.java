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
	
	@GetMapping(value="/adminManagement/daily")
	@ResponseBody
	public Map<String, Object> chartDaily(){
		Map<String, Object> map = null;
		try {
			List<Map<String, Object>> todayOrder = chartService.todayOrder();
			List<Map<String, Object>> todayDelivery = chartService.todayDelivery();
			
			map = new HashMap<String, Object>();
			
			map.put("todayOrder", todayOrder);
			map.put("todayDelivery", todayDelivery);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@GetMapping(value="/adminManagement/week")
	@ResponseBody
	public Map<String, Object> chartWeek(){
		Map<String, Object> map = null;
		try {
			List<Map<String, Object>> weekOrder = chartService.weekOrder();
			List<Map<String, Object>> weekDelivery = chartService.weekDelivery();
			System.out.println("디버그용weekOrder:" + weekOrder);
			System.out.println("디버그용weekDelivery:" + weekDelivery);
			
			map = new HashMap<String, Object>();
			
			map.put("weekOrder", weekOrder);
			map.put("weekDelivery", weekDelivery);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@GetMapping(value="/adminManagement/month")
	@ResponseBody
	public Map<String, Object> chartMonth(){
		Map<String, Object> map = null;
		try {
			List<Map<String, Object>> monthOrder = chartService.monthOrder();
			List<Map<String, Object>> monthDelivery = chartService.monthDelivery();
			System.out.println("디버그용monthOrder:" + monthOrder);
			System.out.println("디버그용monthDelivery:" + monthDelivery);
			
			map = new HashMap<String, Object>();
			
			map.put("monthOrder", monthOrder);
			map.put("monthDelivery", monthDelivery);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
}