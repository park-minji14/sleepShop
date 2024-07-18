package com.sgsg.dra.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.admin.service.FaqManageService;
import com.sgsg.dra.domain.Faq;
import com.sgsg.dra.domain.SessionInfo;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("adminManagement/supportManage/*")
public class FAQManageController {

    @Autowired
    private FaqManageService faqManageService;
	
    @GetMapping("faq")
    public String FAQList(Model model) {
        try {
            Map<String, Object> map = new HashMap<>();

            List<Faq> list = faqManageService.listFAQ(map);
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "FAQ 목록을 불러오는 중 오류가 발생했습니다.");
        }
        
        return ".adminLeft.support.faq";
    }
    
    @PostMapping("faq")
    @ResponseBody
    public Map<String, Object> insertFAQ(@RequestBody Faq faq, HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 세션에서 userId 가져오기
            HttpSession session = request.getSession();
            SessionInfo info = (SessionInfo) session.getAttribute("member");
            if (info != null) {
                faq.setUserId(info.getUserId()); // Faq 객체에 userId 설정
            } else {
                response.put("status", "error");
                response.put("message", "로그인 정보가 없습니다.");
                return response;
            }

            faqManageService.insertFAQ(faq);
            response.put("status", "success");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "FAQ 등록 중 오류가 발생했습니다.");
        }

        return response;
    }
}