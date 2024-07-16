package com.sgsg.dra.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgsg.dra.common.MyUtil;

@Controller
@RequestMapping("adminManagement/supportManage/*")
public class InquiryManageController {
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("supportList")
	public String supportList() {
		
		return ".adminLeft.support.list";
	}
	
}
