package com.sgsg.dra.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sgsg.dra.domain.Member;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("login")
	public String loginForm() {
		return ".member.login";
	}
	
	//회원가입 페이지로 이동
	@GetMapping("member")
	public String memberForm(Model model) {
		model.addAttribute("mode", "member");
		return ".member.member";
	}
	
	// 회원가입 폼 제출을 처리하고,
	// 예외 발생 시 오류 메시지와 함께 회원가입 페이지로 돌아가며,
	// 성공 시 완료 메시지를 리다이렉트된 페이지에 전달
	@PostMapping("member")
	public String memberSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model) {

		try {
			service.insertMember(dto);
		} catch (DuplicateKeyException e) {
			// 기본키 중복에 의한 제약 조건 위반
			model.addAttribute("mode", "member");
			model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (DataIntegrityViolationException e) {
			// 데이터형식 오류, 참조키, NOT NULL 등의 제약조건 위반
			model.addAttribute("mode", "member");
			model.addAttribute("message", "제약 조건 위반으로 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "회원가입이 실패했습니다.");
			return ".member.member";
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");

		// 리다이렉트된 페이지에 값 넘기기
		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "회원 가입");

		return "redirect:/member/complete";
	}
	
	
	@GetMapping("complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {

		// 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다.
		// F5를 눌러 새로 고침을 하면 null이 된다.

		if (message == null || message.length() == 0) // F5를 누른 경우
			return "redirect:/";

		return ".member.complete";
	}
	
	
	// @ResponseBody : 자바 객체를 HTTP 응답 몸체로 전송(AJAX에서 JSON 전송 등에 사용)
	@PostMapping("userIdCheck")
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam String userId) throws Exception {
		// ID 중복 검사
		String p = "true";
		Member dto = service.findById(userId);
		if (dto != null) {
			p = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	@GetMapping("pwd")
	public String pwdForm(String dropout, Model model) {

		if (dropout == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}

		return ".member.pwd";
	}
	
	@PostMapping("pwd")
	public String pwdSubmit(@RequestParam String userPwd,
			@RequestParam String mode, 
			final RedirectAttributes reAttr,
			HttpSession session,
			Model model) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Member dto = service.findById(info.getUserId());
		if (dto == null) {
			session.invalidate();
			return "redirect:/";
		}

		boolean bPwd = service.isPasswordCheck(info.getUserId(), userPwd);
		if ( ! bPwd ) {
			model.addAttribute("mode", mode);
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".member.pwd";
		}

		if (mode.equals("dropout")) {
			// 게시판 테이블등 자료 삭제

			// 회원탈퇴 처리
			/*
			  Map<String, Object> map = new HashMap<>();
			  map.put("memberIdx", info.getMemberIdx());
			  map.put("userId", info.getUserId());
			 */

			// 세션 정보 삭제
			session.removeAttribute("member");
			session.invalidate();

			StringBuilder sb = new StringBuilder();
			sb.append(dto.getUserName() + "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

			reAttr.addFlashAttribute("title", "회원 탈퇴");
			reAttr.addFlashAttribute("message", sb.toString());

			return "redirect:/member/complete";
		}
	
	
		// 회원정보수정폼
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".member.member";
	}
	
	
	@PostMapping("update")
	public String updateSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model) {

		try {
			service.updateMember(dto);
		} catch (Exception e) {
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName() + "님의 회원정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

		reAttr.addFlashAttribute("title", "회원 정보 수정");
		reAttr.addFlashAttribute("message", sb.toString());

		return "redirect:/member/complete";
	}
	

	// 패스워드 찾기
	@GetMapping("pwdFind")
	public String pwdFindForm(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info != null) {
			return "redirect:/";
		}
		
		return ".member.pwdFind";
	}
	
	/*
	@PostMapping("pwdFind")
	public String pwdFindSubmit(@RequestParam String userId,
			RedirectAttributes reAttr,
			Model model) throws Exception {
		
		Member dto = service.findById(userId);
		if(dto == null || dto.getEmail() == null || dto.getEnabled() == 0) {
			model.addAttribute("message", "등록된 아이디가 아닙니다.");
			return ".member.pwdFind";
		}
		
		try {
			service.generatePwd(dto);
		} catch (Exception e) {
			model.addAttribute("message", "이메일 전송이 실패했습니다.");
			return ".member.pwdFind";
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append("회원님의 이메일로 임시패스워드를 전송했습니다.<br>");
		sb.append("로그인 후 패스워드를 변경하시기 바랍니다.<br>");
		
		reAttr.addFlashAttribute("title", "패스워드 찾기");
		reAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/member/complete";
	}
	*/
	
	
	@GetMapping("checkLoginStatus")
	@ResponseBody
	public Map<String, Boolean> checkLoginStatus(HttpSession session) {
	    Map<String, Boolean> response = new HashMap<>();
	    response.put("loggedIn", session.getAttribute("member") != null);
	    return response;
	}

	@GetMapping("noAuthorized")
	public String noAuthorized(Model model) {
		// 권한이 없는 경우
		return ".member.noAuthorized";
	}

	@GetMapping("expired")
	public String expired(Model model) {
		// 세션이 만로 된 경우
		return ".member.expired";
	}
	
	// ---------------------------------
	@GetMapping("updatePwd")
	public String updatePwd() throws Exception {
		// 패스워드 변경 폼
		return ".member.updatePwd";
	}
	
	@PostMapping("updatePwd")
	public String updatePwdSubmit(
			@RequestParam String userPwd,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Member dto = new Member();
		dto.setUserId(info.getUserId());
		dto.setUserPwd(userPwd);
		
		try {
			service.updatePwd(dto);
		} catch (RuntimeException e) {
			model.addAttribute("message", "변경할 패스워드가 기존 패스워드와 일치합니다.");
			return ".member.updatePwd";
		} catch (Exception e) {
		}
		
		return "redirect:/";
	}	
	
}
