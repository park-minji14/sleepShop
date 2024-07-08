package com.sgsg.dra.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainManageController {
	 
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminMain() {
		
		return ".adminLayout";
	}
	
	
	@RequestMapping(value="/adminManagement", method=RequestMethod.GET)
	public String adminSideLayout() {
		
		return ".adminManagement";
	}
	
}