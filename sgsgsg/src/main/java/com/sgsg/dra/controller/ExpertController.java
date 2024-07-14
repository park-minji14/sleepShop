package com.sgsg.dra.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/expert/*")
public class ExpertController {
	
	@GetMapping("list")
	public String Expertlist() {
		
		return ".expert.list";
	}
	
}
