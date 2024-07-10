package com.sgsg.dra.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value ="/member/*")
public class MyPageController {
	
	@GetMapping("mypage")
	public String list() {
		
		return ".member.mypage";
	}
}

