package com.sgsg.dra.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("adminManagement/orderManage/*")
public class OrderManageController {

	@RequestMapping("main")
	public String productManage() {
		
		return ".adminLeft.order.main";
	}
}
