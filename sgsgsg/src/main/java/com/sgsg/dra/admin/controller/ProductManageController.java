package com.sgsg.dra.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("adminManagement/productManage/*")
public class ProductManageController {
	private String str = "test";
	
	@RequestMapping("list")
	public String productManage() {
		
		return ".adminLeft.product.list";
	}
	
	@GetMapping("productWrite")
	public String productWrite() {
		return ".adminLeft.product.write";
	}
	
	@PostMapping("productSubmit")
	public String productSubmit() {
		return ".adminLeft.product.list";
	}
	
}
