package com.sgsg.dra.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainManageController {
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminMain(Model model) {
		
		return ".adminLayout";
	}
	
	
	@RequestMapping(value="/adminManagement", method=RequestMethod.GET)
	public String adminSideLayout() {
        
		return ".adminManagement";
	}
	
	@GetMapping(value="/adminManagement/charts")
	@ResponseBody
	public Map<String, Object> chartThing(){
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		return model;
	}
	
}