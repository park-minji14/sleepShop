package com.sgsg.dra.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgsg.dra.admin.service.ReturnManageService;
import com.sgsg.dra.domain.Return;

@Controller
@RequestMapping("adminManagement/returnManage/*")
public class ReturnManageController {
	
	@Autowired
	private ReturnManageService service;

	@RequestMapping("return")
	public String returnManage(Model model) throws Exception {
		
		try {
			List<Return> list = service.listReturnRequest();
			
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".adminLeft.order.return";
	}
}
