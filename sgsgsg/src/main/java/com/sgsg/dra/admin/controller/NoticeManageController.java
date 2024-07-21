package com.sgsg.dra.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgsg.dra.common.MyUtil;

@Controller
@RequestMapping("adminManagement/noticeManage/*")
public class NoticeManageController {
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("main")
	public String main() {
		return ".adminLeft.notice.noticeList";
	}
	
}
