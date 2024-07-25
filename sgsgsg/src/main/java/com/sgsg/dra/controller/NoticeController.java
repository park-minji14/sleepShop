package com.sgsg.dra.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Notice;
import com.sgsg.dra.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@Autowired
	MyUtil myUtil;
	
	@GetMapping("userNotice")
	public String noticeList(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "status", defaultValue = "0") int status,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		/* 검색 나중에
		 * map.put("schType", schType); 
		 * map.put("kwd", kwd);
		 */
		
		dataCount = service.dataCount(map);
		total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) {
			offset = 0;
		}
		map.put("offset", offset);
		map.put("size", size);
		
		List<Notice> list = service.listNotice(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/notice/userNotice";
		String query = "";
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("status", status);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("paging", paging);
		
		return ".notice.list";
	}
	
	@GetMapping("userArticle")
	public String noticeArticle(
			@RequestParam(value="status", defaultValue = "0") int status,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "articleNum") long articleNum,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception{
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + current_page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		Notice dto = service.findById(articleNum);
		if (dto == null) {
			return "redirect:/notice/userNotice?" + query;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("num", articleNum);
		map.put("status", status);
		
		Notice prevDTO = service.findByNext(map);
		Notice nextDTO = service.findByPrev(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("status", status);
		model.addAttribute("prevDTO", prevDTO);
		model.addAttribute("nextDTO", nextDTO);
		model.addAttribute("page", current_page);
		model.addAttribute("query", query);
		
		return ".notice.article";
	}
}
