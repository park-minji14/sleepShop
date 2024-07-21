package com.sgsg.dra.admin.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.sgsg.dra.admin.domain.SpecialsDetailManage;
import com.sgsg.dra.admin.domain.SpecialsManage;
import com.sgsg.dra.admin.service.SpecialsManageService;
import com.sgsg.dra.common.MyUtil;

@Controller
@RequestMapping("adminManagement/productManage/*")
public class SpecialsManageController {
	@Autowired
	private SpecialsManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("specialList")
	public String list(
			@RequestParam(defaultValue = "1") int state,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,		
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();
		
		int size = 8;
		int total_page;
		int dataCount;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state); // 1: 진행중, 2: 예정, 3: 특가종료
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCountSpecials(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<SpecialsManage> list = service.listSpecials(map);
		
		String listUrl = cp + "/adminManagement/productManage/specialList";
		String articleUrl = cp + "/adminManagement/productManage/specialArticle?page=" + current_page;
		String query = "";
		
		if(state != 1) {
			query = "state=" + state;
		}
		if (kwd.length() != 0) {
			query += query.length() != 0 ? "&" : "";
			query += "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		if(query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}

		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		
		model.addAttribute("state", state);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".adminLeft.product.specialList";
	}

	@GetMapping("specialWrite")
	public String writeForm(
			Model model) throws Exception {
		
		model.addAttribute("mode", "specialWrite");
		
		return ".adminLeft.product.specialWrite";
	}

	@PostMapping("specialWrite")
	public String writeSubmit(
			SpecialsManage dto,
			HttpSession session,
			Model model) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "specials";
		
		try {
			service.insertSpecials(dto, path);
		} catch (Exception e) {
		}
		
		return "redirect:/adminManagement/productManage/specialList";
	}
	
	@GetMapping("specialArticle")
	public String article(
			@RequestParam long specialNum,
			@RequestParam(defaultValue = "1") int state,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam String page,
			Model model) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if(state != 1) {
			query += "&state=" + state;
		}
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		SpecialsManage dto = service.findById(specialNum);

		if (dto == null) {
			return "redirect:/adminManagement/productManage/specialList?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("page", page);
		
		return ".adminLeft.product.specialArticle";
	}
	
	@GetMapping("specialUpdate")
	public String updateForm(
			@RequestParam long specialNum,
			@RequestParam String page,
			Model model) throws Exception {
		
		SpecialsManage dto = service.findById(specialNum);

		if (dto == null) {
			return "redirect:/adminManagement/productManage/specialList?page=" + page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);		
		model.addAttribute("mode", "specialUpdate");
		
		return ".adminLeft.product.specialWrite";
	}

	@PostMapping("specialUpdate")
	public String updateSubmit(
			SpecialsManage dto,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "specials";
		
		try {
			service.updateSpecials(dto, path);
		} catch (Exception e) {
		}
		
		return "redirect:/adminManagement/productManage/specialList?page=" + page;
	}
	
	@GetMapping("specialDelete")
	public String delete(
			@RequestParam(defaultValue = "1") int state,
			@RequestParam long specialNum,
			@RequestParam String page,
			@RequestParam String imageFilename,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if(state != 1) {
			query += "&state=" + state;
		}
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "specials" + File.separator + imageFilename;

		try {
			service.deleteSpecials(specialNum, pathname);
		} catch (Exception e) {
		}

		return "redirect:/adminManagement/productManage/specialList?" + query;
	}	
	
	// 특가/기획전에  상품 등록
	// AJAX - JSON
	@PostMapping("specialProductInsert")
	@ResponseBody
	public Map<String, Object> productInsert(
			SpecialsDetailManage dto) throws Exception {

		String state = "true";
		try {
			service.insertSpecialsDetail(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

	// 특가에 등록되어있는 상품 목록
	// AJAX - JSON
	@GetMapping("specialProductList")
	@ResponseBody
	public Map<String, Object> productList(
			@RequestParam long specialNum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page) throws Exception {
		
		int size = 10;
		int total_page;
		int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("specialNum", specialNum);
		
		dataCount = service.dataCountDetail(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<SpecialsDetailManage> list = service.listSpecialsDetail(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("pageNo", current_page);
		model.put("total_page", total_page);
		model.put("size", size);
		model.put("paging", paging);
		
		return model;
	}

	// 특가/기획전에  상품 등록
	// AJAX - JSON
	@PostMapping("specialProductUpdate")
	@ResponseBody
	public Map<String, Object> productUpdate(
			SpecialsDetailManage dto) throws Exception {

		String state = "true";
		try {
			service.updateSpecialsDetail(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	// 특가/기획전에 등록된 상품 삭제
	// AJAX - JSON
	@PostMapping("specialProductDelete")
	@ResponseBody
	public Map<String, Object> productDelete(
			@RequestParam long detailNum) throws Exception {

		String state = "true";
		try {
			service.deleteSpecialsDetail(detailNum);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

	// 특가/기획전에 등록할 상품 검색
	// AJAX - JSON
	@GetMapping("specialProductSearch")
	@ResponseBody
	public Map<String, Object> productSearch(
			@RequestParam long specialNum,
			@RequestParam String schType,
			@RequestParam String kwd) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("specialNum", specialNum);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		List<SpecialsDetailManage> list = service.specialsProductSearch(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		return model;
	}

}
