package com.sgsg.dra.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("adminManagement/productManage/*")
public class ProductManageController {
	
	@RequestMapping("list")
	public String productManage() {
		return ".adminLeft.product.list";
	}
	
	@PostMapping("productSubmit")
	public String productSubmit() {
		return ".adminLeft.product.proSubmit";
	}
}
