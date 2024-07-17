package com.sgsg.dra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sgsg.dra.domain.Expert;
import com.sgsg.dra.service.ExpertService;

@Controller
@RequestMapping("/expert/*")
public class ExpertController {
    
    @Autowired
    private ExpertService expertService;
    
    @GetMapping("profile")
    public String Expertprofile(@RequestParam("userId") String userId, Model model) {
    	
        Expert dto = null;
        int answerCount = 0;
        int acceptedAnswerCount = 0;
        double acceptanceRate = 0.0;
		try {
			dto = expertService.getExpertProfile(userId);
            answerCount = expertService.getAnswerCount(userId);
            acceptedAnswerCount = expertService.getAcceptedAnswerCount(userId);
            if (answerCount > 0) {
                acceptanceRate = ((double) acceptedAnswerCount / answerCount) * 100;
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        model.addAttribute("dto", dto);
        model.addAttribute("answerCount", answerCount);
        model.addAttribute("acceptedAnswerCount", acceptedAnswerCount);
        model.addAttribute("acceptanceRate", String.format("%.1f", acceptanceRate));
        
        return ".expert.profile";
    }
    
    
    
    @GetMapping("editprofile")
    public String editprofile(@RequestParam("userId") String userId, Model model) {
    	
        Expert dto = null;
		try {
			dto = expertService.getExpertProfile(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        model.addAttribute("dto", dto);
        
        return ".expert.editprofile";
    }
    
    
     
    @PostMapping("editprofile")
    public String updateExpertProfile(Expert dto) {
        expertService.updateExpertProfile(dto);
        return "redirect:/expert/profile?userId=" + dto.getUserId();
    }
}
