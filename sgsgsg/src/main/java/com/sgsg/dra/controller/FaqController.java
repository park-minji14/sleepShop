package com.sgsg.dra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgsg.dra.admin.service.FaqManageService;
import com.sgsg.dra.domain.Faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/faq/*")
public class FaqController {

    @Autowired
    private FaqManageService service;

    @GetMapping("list")
    public String list(Model model) {
        try {
            Map<String, Object> map = new HashMap<>();
            List<Faq> list = service.listFAQ(map);
            
            for (Faq faq : list) {
                System.out.println("FAQ: " + faq.getQuestion());  // 각 FAQ 출력
            }
            
            model.addAttribute("list", list);
            model.addAttribute("debugMessage", "컨트롤러에서 FAQ 리스트 로드 완료");  // 디버깅 메시지
        } catch (Exception e) {
            e.printStackTrace(); 
            model.addAttribute("errorMessage", "FAQ 로드 중 오류 발생: " + e.getMessage());
        }
        
        return ".faq.list";
    }
}