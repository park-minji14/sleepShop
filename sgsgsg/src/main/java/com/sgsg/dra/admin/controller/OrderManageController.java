package com.sgsg.dra.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.admin.service.OrderManageService;
import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Order;

@Controller
@RequestMapping("adminManagement/orderManage/*")
public class OrderManageController {
	
	@Autowired
	private OrderManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
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
			
			dataCount = service.dataCount(map);
			total_page = myUtil.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if(offset <0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<Order> orderList = service.listOrder(map);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/adminManagement/orderManage/order";
			String articleUrl = cp + "/adminManagement/orderManage/order/detail?page="+current_page;
			String query="";
			if(kwd.length() != 0) {
				query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}
			if(query.length() != 0) {
				listUrl += "?"+ query;
				articleUrl += "&" + query;
			}
			
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
			
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("size", size);
			
			model.addAttribute("paging", paging);
			model.addAttribute("articleUrl", articleUrl);
			
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
	
	@PostMapping("order/detail")
	@ResponseBody
	public Map<String, Object> insertDelivery(@RequestParam Map<String, Object> paramMap) throws Exception {
		String state = "true";
		
		try {
			service.insertDelivery(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	
	@PostMapping("order/delivery")
	@ResponseBody
	public Map<String, Object> delivery(@RequestParam Map<String, Object> paramMap) throws Exception {
		String state = "true";
		
		try {
			service.updateDeliveryState(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("order/cancelOrder")
	@ResponseBody
	public Map<String, Object> cancelOrder(@RequestParam Map<String, Object> paramMap) throws Exception {
		String state = "false";
		
		try {
			service.cancelOrder(paramMap);
			state="true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	
}
