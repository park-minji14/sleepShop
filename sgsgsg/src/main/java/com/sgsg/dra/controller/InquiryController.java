package com.sgsg.dra.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.sgsg.dra.domain.Inquiry;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.InquiryService;


//인콰이어리(1:1 문의)
@Controller
@RequestMapping("/inquiry/*")
public class InquiryController {
	@Autowired
	private InquiryService service;
	
	@Autowired
	private MyUtil myUtil;
	
	// AJAX-리스트:Text 
	@GetMapping(value = "list")
	public String list(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {

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

		// 글 리스트
		List<Inquiry> list = service.listInquiry(map);

		// AJAX-paging
		String paging = myUtil.pagingMethod(current_page, total_page, "listInquiry");

		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return "mypage/oneToone";
	}
	
	
	@ResponseBody
	@PostMapping("write")
	public Map<String, Object> writeSubmit(Inquiry dto, 
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "true";
		try {
			dto.setUserId(info.getUserId());
			service.insertInquiry(dto);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	// 글보기
	// AJAX-리스트:Text 	
	@GetMapping("article")
	public String article(@RequestParam long num,
			@RequestParam String pageNo,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletResponse resp,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		kwd = URLDecoder.decode(kwd, "utf-8");

		Inquiry dto = service.findById(num);
		if (dto == null) {
			resp.sendError(410);
			return null;
		}

		if ( !info.getUserId().equals(dto.getUserId()) ) {
			resp.sendError(402);
			return null;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return "mypage/oneTooneDetails";
	}
	
	// 삭제
	@ResponseBody
	@PostMapping("delete")
	public Map<String, Object>  delete(@RequestParam long num,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "false";
		
		Inquiry dto = service.findById(num);
		if (dto != null) {
			if (info.getUserId().equals(dto.getUserId()) ) {
				try {
					service.deleteInquiry(num);
					
					state = "true";
					
				} catch (Exception e) {
				
				}
			}
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	
}
		

