package com.sgsg.dra.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.domain.Product;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.CartService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Autowired
	private CartService service;

	@GetMapping("list")
	public String cartList(Model model, HttpSession session) {
		//HttpSession session
		
		// 시간별, 같은 회사별, 같은 상품별 정렬...
		
		 
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			if(info == null) {
				return ".member.login";
			}
			List<Product> list= service.selectCartList(info.getUserId());
			
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".cart.cart";
	}
	
	@PostMapping("insertCart")
	@ResponseBody
	public Map<String, Object> insertCart(Product dto, HttpSession session) {
		String state = "true";

		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.inserCart(dto);
		} catch (DuplicateKeyException e) {
			state = "duplicate";
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@PostMapping("updateQty")
	@ResponseBody
	public Map<String, Object> updateQty(Product dto, HttpSession session) {
		String state = "true";
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.updateQty(dto);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@PostMapping("deleteCart")
	@ResponseBody
	public Map<String, Object> deleteCart(Product dto, HttpSession session) {
		String state = "true";

		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.deleteCart(dto);
		} catch (Exception e) {
			state="false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
}
