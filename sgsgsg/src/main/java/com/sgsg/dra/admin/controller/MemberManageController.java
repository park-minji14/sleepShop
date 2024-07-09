package com.sgsg.dra.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("adminManagement/memberManage/*")
public class MemberManageController {
	
	@GetMapping("list")
	public String memberList() {
		return ".adminLeft.member.list";
	}
	
	@GetMapping("details")
	public String memberDetails() {
		return ".adminLeft.member.details";
	}
	
	
	
}
