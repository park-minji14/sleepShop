package com.sgsg.dra.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sgsg.dra.admin.domain.InquiryManage;
import com.sgsg.dra.admin.service.InquiryManageService;
import com.sgsg.dra.common.MyUtil;


@Controller
@RequestMapping("adminManagement/supportManage/*")
public class InquiryManageController {
	@Autowired
	private InquiryManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")	
	private MyUtil myUtil;
	
	@RequestMapping("supportList")
	public String supportList(@RequestParam(value = "page", defaultValue = "1") int current_page,
				@RequestParam(defaultValue = "all") String schType,
				@RequestParam(defaultValue = "") String kwd,
				HttpServletRequest req,
				HttpSession session,
				Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		
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
		List<InquiryManage> list = service.listInquiry(map);

		String query = "";
		String listUrl = cp + "/admin/inquiryManage/list";
		String articleUrl = cp + "/admin/inquiryManage/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}

		if (query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		System.out.println("");
		
		
		
		return ".adminLeft.support.list";
	}
	
	
	
	@GetMapping("supportArticle")
	public String supportArticle(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		InquiryManage dto = service.findById(num);
		if (dto == null) {
			return "redirect:/admin/inquiryManage/list?" + query;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("query", query);

		return ".adminLeft.support.article";
	}
	
	
	
}
