package com.sgsg.dra.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/expertapply/*")
public class ExpertApplyController {
	
	@GetMapping("apply")
	public String Expertprofile() {
		
		return ".expertapply.apply";
	}

}
