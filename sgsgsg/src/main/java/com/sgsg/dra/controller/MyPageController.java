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
	

	// 나의 쇼핑
	@GetMapping("myshop")
	public String myshop() {
		return "mypage/myshop";
	}
	
	// 포인트
	@GetMapping("point")
	public String point() {
		// 서비스에서내 트인트 리스트 가져오기
		
		
		
		
		return "mypage/point";
	}
	
	// 마이 리뷰
	@GetMapping("review")
	public String review() {
		
		
		
		
		return "mypage/review";
	}
		
	// 최근 본 상품
	@GetMapping("recent")
	public String recentProduct() {
		return "mypage/recentProduct";
	}
	
	// 찜한 상품
	@GetMapping("wishlist")
	public String wishlist() {
		return "mypage/wishlist";
	}
	
	

}
