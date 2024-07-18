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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.domain.Product;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.CartService;
import com.sgsg.dra.state.OrderState2;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Autowired
	private CartService service;

	@GetMapping("list")
	public String cartList(Model model, HttpSession session) {
 
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
		
		OrderState2 state2 = OrderState2.결제완료;
		System.out.println(state2);
		System.out.println(state2.name());
		System.out.println(state2.ordinal());
		System.out.println(OrderState2.valueOf("입금대기"));
		
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
	
	@GetMapping("updateQty")
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
	
	@PostMapping("deleteCartItem")
	@ResponseBody
	public Map<String, Object> deleteCartitem(Long stockNum, HttpSession session){
		String state = "true";
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "item");
			map.put("userId", info.getUserId());
			map.put("stockNum", stockNum);
			
			service.deleteCart(map);
			
		} catch (Exception e) {
			state="false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@PostMapping("deleteCart")
	public String deleteCart(@RequestParam List<Long> stockNum, HttpSession session) {
		

		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "list");
			map.put("userId", info.getUserId());
			map.put("stockNum", stockNum);
			
			service.deleteCart(map);
			
		} catch (Exception e) {
		}
		
		return "redirect:/cart/list";
	}
}
