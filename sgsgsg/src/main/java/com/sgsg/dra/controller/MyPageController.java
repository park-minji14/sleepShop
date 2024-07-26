package com.sgsg.dra.controller;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Member;
import com.sgsg.dra.domain.MyPoint;
import com.sgsg.dra.domain.Review;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.domain.Wishlist;
import com.sgsg.dra.service.MemberService;
import com.sgsg.dra.service.MyPageService;
import com.sgsg.dra.service.WishlistService;

@Controller
@RequestMapping(value ="/mypage/*")
public class MyPageController {
	@Autowired
	private MyPageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
    private WishlistService wishlistService;
	
	@Autowired
	private MemberService memberService;
	
	// 메인화면
	@GetMapping("main")
	public String main() {
		return ".mypage.main";
	}
	
	// 나의 쇼핑
	@GetMapping("myshop")
	public String myshop(HttpSession session,
			Model model) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("offset", 0);
		map.put("size", 5);
		
		
		
		
		return "mypage/myshop";
	}
	
	// 포인트
	@GetMapping("point")
	public String point(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		// 서비스에서내 트인트 리스트 가져오기
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		kwd = URLDecoder.decode(kwd, "utf-8");
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("userId", info.getUserId());
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 최근 포인트 내역
		MyPoint point = service.readPoint(map);

		// 포인트 전체 리스트
		List<MyPoint> list = service.listPoint(map);

		// AJAX-paging
		String paging = myUtil.pagingMethod(current_page, total_page, "listPoint");

		model.addAttribute("point", point);
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
			
		return "mypage/point";
	}

	// 구매목록 리스트
	@GetMapping("savedList")
	public String savedList(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") int state,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		// 서비스에서내 트인트 리스트 가져오기
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("userId", info.getUserId());
		
		dataCount = service.reviewCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
	
		List<Review> list = service.listReview(map);

		// AJAX-paging
		String paging = myUtil.pagingMethod(current_page, total_page, "listSaved");

		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("state", state);

		return "mypage/savedList";
	}
	
	//리뷰 작성
	@ResponseBody
	@PostMapping("reviewWrite")
	public Map<String, Object> writeSubmit(Review dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "true";
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"review";
		try {
			dto.setUserId(info.getUserId());
			service.insertReview(dto, pathname);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	
	//리뷰 삭제
	@ResponseBody
	@PostMapping("reviewDelete")
	public Map<String, Object>  delete(@RequestParam long orderDetailNum,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "false";
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"review";
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("orderDetailNum", orderDetailNum);
			map.put("userId", info.getUserId());
			
			service.deleteReview(map, pathname);
					
			state = "true";
					
		} catch (Exception e) {
				
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
		
	// 최근 본 상품
	@GetMapping("recent")
	public String recentProduct() {
		return "mypage/recentProduct";
	}
	
	
	
	// 찜한 상품
    @GetMapping("wishlist")
    public String wishlist(HttpSession session, Model model) {
        SessionInfo info = (SessionInfo) session.getAttribute("member");

        List<Wishlist> list = wishlistService.listWishlist(info.getUserId());
        int count = wishlistService.getWishlistCount(info.getUserId());

        model.addAttribute("list", list);
        model.addAttribute("wishlistCount", count);

        return "mypage/wishlist";
    }
	
	// 설정 
	@GetMapping("settings")
	public String settings(HttpSession session,
			Model model) throws Exception {
		
		 SessionInfo info = (SessionInfo) session.getAttribute("member");
		 
		 Member dto = memberService.findById(info.getUserId());
		 
		 model.addAttribute("dto", dto);
		
		return "mypage/settings";
	}
	
	
	

}
