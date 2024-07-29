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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.admin.service.ReturnManageService;
import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Return;

@Controller
@RequestMapping("adminManagement/returnManage/*")
public class ReturnManageController {
	
	@Autowired
	private ReturnManageService service;
	
	@Autowired
	private MyUtil myUtil;

	@RequestMapping("return")
	public String returnManage(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "orderNum") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10;
		int total_page;
		int dataCount;
		
		try {
			if (req.getMethod().equalsIgnoreCase("GET")) {
				kwd = URLDecoder.decode(kwd, "UTF-8");
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			
			//
			dataCount = service.dataCount(map);
			total_page = myUtil.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if (offset < 0) {
				offset = 0;
			}
			
			map.put("offset", offset);
			map.put("size", size);
			
			
			List<Return> list = service.listReturnRequest(map);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/adminManagement/returnManage/return";
			String articleUrl = cp + "/adminManagement/returnManage/return/detail?page="+current_page;
			String query="";
			if(kwd.length() != 0) {
				query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}
			if(query.length() != 0) {
				listUrl += "?"+ query;
				articleUrl += "&" + query;
			}
			
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("size", size);
			
			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
			model.addAttribute("paging", paging);
			model.addAttribute("articleUrl", articleUrl);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".adminLeft.order.return";
	}
	
	@PostMapping("confirm")
	@ResponseBody
	public Map<String, Object> returnConfirm(@RequestParam Map<String, Object> paramMap) throws Exception {
		String state = "false";
		
		try {
			service.updateRetrunRequest(paramMap);
			state = "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	};
	
}
