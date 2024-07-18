package com.sgsg.dra.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sgsg.dra.admin.domain.MemberManage;
import com.sgsg.dra.admin.service.MemberManageService;
import com.sgsg.dra.common.MyUtil;

@Controller
@RequestMapping("adminManagement/memberManage/*")
public class MemberManageController {
	@Autowired
	private MemberManageService service;

	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;

	// 회원 리스트
	@RequestMapping("list")
	public String memberList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "userId") String schType, 
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "") String enabled, 
			HttpServletRequest req, 
			Model model) throws Exception {

		String cp = req.getContextPath();

		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enabled", enabled);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 멤버 리스트
		List<MemberManage> list = service.listMember(map);

		String query = "";
		String listUrl = cp + "/adminManagement/memberManage/list";

		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}

		if (enabled.length() != 0) {
			if (query.length() != 0)
				query = query + "&enabled=" + enabled;
			else
				query = "enabled=" + enabled;
		}

		if (query.length() != 0) {
			listUrl = listUrl + "?" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("enabled", enabled);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return ".adminLeft.member.list";
	}

	@GetMapping("details")
	public String memberDetails(@RequestParam Long memberIdx,
			@RequestParam String page,
			@RequestParam(defaultValue = "userId") String schType, 
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "") String enabled,
			Model model) throws Exception {
		
		String query = "page=" + page;
		if(enabled.length() != 0) {
			query += "&enabled=" + enabled;
		}
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		MemberManage dto = service.findById(memberIdx);
		if(dto == null) {
			return "redirect:/adminManagement/memberManage/list?" + query;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		

		return ".adminLeft.member.details";
	}
	
	
	
	

}
