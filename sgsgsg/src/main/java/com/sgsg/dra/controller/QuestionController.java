package com.sgsg.dra.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Question;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.QuestionService;

@RestController
@RequestMapping("/question/*")
public class QuestionController {
	@Autowired
	private QuestionService service;
	
	@Autowired
	private MyUtil myUtil;
	
	//상품문의 글작성
	@PostMapping("write")
	public Map<String, Object>  createQuestion(Question dto,HttpServletRequest request, HttpSession session) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"question";

		String state ="true";
		try {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		service.insertQuestion(dto, pathname);
		 
		} catch (Exception e) {
		state="false";
		    e.printStackTrace();
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
		}
}
