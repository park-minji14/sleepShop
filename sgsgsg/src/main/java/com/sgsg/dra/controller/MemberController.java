package com.sgsg.dra.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.domain.Member;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@GetMapping("login")
	public String loginForm() {
		return ".member.login";
	}
	@PostMapping("login")
	public String loginSubmit(@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession session,
			Model model) {
		Member dto = service.loginMember(userId);
		if (dto == null || !userPwd.equals(dto.getUserPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}
		
		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setMemberIdx(dto.getMemberIdx());
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		info.setMembership(dto.getMembership());
		
		//세션유지시간 30분, 기본:30분
		session.setMaxInactiveInterval(30 * 60); 

		session.setAttribute("member", info);

		// 로그인 이전 URI로 이동
		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}

		return "redirect:/";
	}
	
	
	@GetMapping("checkLoginStatus")
	@ResponseBody
	public Map<String, Boolean> checkLoginStatus(HttpSession session) {
	    Map<String, Boolean> response = new HashMap<>();
	    response.put("loggedIn", session.getAttribute("member") != null);
	    return response;
	}
}
