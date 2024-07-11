package com.sgsg.dra.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value ="/mypage/*")
public class MyPageController {
	
	//메인화면
	@GetMapping("main")
	public String main() {
		
		return ".mypage.main";
	}
	
	
	//포인트
	@GetMapping("point")
	public String point() {
		
		return ".mypage.point";
	}
	
}

