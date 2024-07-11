package com.sgsg.dra.admin.controller;

import java.io.File;
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

import com.sgsg.dra.admin.domain.ProductManage;
import com.sgsg.dra.admin.service.ProductManageService;
import com.sgsg.dra.common.MyUtil;

@Controller
@RequestMapping("adminManagement/productManage/*")
public class ProductManageController {
	
	@Autowired
	private ProductManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String productManageList(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") long parentNum,
			@RequestParam(defaultValue = "0") long categoryNum,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		
		List<ProductManage> listCategory = service.listCategory();
		List<ProductManage> listSubCategory = null;
		if(parentNum == 0 && listCategory.size() !=0) {
			parentNum = listCategory.get(0).getCategoryNum();
		}
		listSubCategory = service.listSubCategory(parentNum);
		if(categoryNum == 0 && listSubCategory.size() != 0) {
			categoryNum = listSubCategory.get(0).getCategoryNum();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) {
			offset = 0;
		}
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<ProductManage> list = service.listProduct(map);
		
		String listUrl = cp + "/adminManagement/productManage/list";
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		
		return ".adminLeft.product.list";
	}
	
	@GetMapping("productWrite")
	public String productWriteForm(Model model) {
		List<ProductManage> listCategory = service.listCategory();
		List<ProductManage> listSubCategory = null;
		long parentNum = 0;
		if(listCategory.size() != 0) {
			parentNum = listCategory.get(0).getCategoryNum();
		}
		listSubCategory = service.listSubCategory(parentNum);
		
		model.addAttribute("mode", "productWrite");
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		
		return ".adminLeft.product.write";
	}
	
	@PostMapping("productWrite")
	public String productSubmit(
			ProductManage dto,
			HttpSession session,
			Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "product";
		
		try {
			service.insertProduct(dto, path);
		} catch (Exception e) {
		}
		
		return "redirect:/adminManagement/productManage/list";
	}
	
	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(
			@RequestParam long parentNum) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<ProductManage> listSubCategory = service.listSubCategory(parentNum);
		
		model.put("listSubCategory", listSubCategory);
		
		return model;
	}
}
