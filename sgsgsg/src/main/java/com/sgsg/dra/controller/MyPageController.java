package com.sgsg.dra.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value ="/mypage/*")
public class MyPageController {
	
	// 메인화면
	@GetMapping("main")
	public String main() {
		
		return ".mypage.main";
	}
	
	
	//포인트
	@GetMapping("point")
	public String point() {
		
		return ".mypage.point";
	}
	
	
	
	//마이 리뷰
	@GetMapping("review")
	public String review() {
		
		return ".mypage.review";
	}
	
		
		
	//최근 본 상품
	@GetMapping("recentProduct")
	public String recentProduct() {
		
		return ".mypage.recentProduct";
	}
		
	
	//1:1문의
	@GetMapping("oneToone")
	public String oneToone() {
		
		return ".mypage.oneToone";
	}
	
	
	
	//찜한 상품
	@GetMapping("wishlist")
	public String wishlist() {
		
		return ".mypage.wishlist";
	}
	
	

}

