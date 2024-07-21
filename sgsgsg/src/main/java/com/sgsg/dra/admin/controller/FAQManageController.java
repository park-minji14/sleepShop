package com.sgsg.dra.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.admin.service.FaqManageService;
import com.sgsg.dra.domain.Faq;
import com.sgsg.dra.domain.SessionInfo;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("adminManagement/supportManage/*")
public class FAQManageController {
	
    @Autowired
    private FaqManageService service;
	
    // FAQ 목록 페이지 보여주는 메서드임
    // 서비스에서 FAQ 리스트 가져와서 모델에 추가하고 뷰 이름 반환함
    @GetMapping("faq")
    public String FAQList(Model model) {
        try {
            Map<String, Object> map = new HashMap<>();
            List<Faq> list = service.listFAQ(map);
            model.addAttribute("list", list);

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "FAQ 목록을 불러오는 중 오류가 발생했습니다.");
        }
        return ".adminLeft.support.faq";
    }
    
    // 새로운 FAQ 등록하는 메서드임
    // AJAX 요청으로 받은 FAQ 데이터 처리하고 결과 JSON으로 반환함
    @PostMapping("faq")
    @ResponseBody
    public Map<String, Object> insertFAQ(@RequestBody Faq faq, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            SessionInfo info = (SessionInfo) session.getAttribute("member");
            if (info == null) {
                throw new IllegalStateException("로그인 정보가 없습니다.");
            }
            faq.setUserId(info.getUserId());
            
            service.insertFAQ(faq);
            
            response.put("status", "success");
            response.put("message", "FAQ가 성공적으로 등록되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "FAQ 등록 중 오류가 발생했습니다: " );
        }
        return response;
    }
    
    // FAQ 목록 JSON으로 반환하는 메서드임
    // userType에 따라 다른 목록 반환함 (admin이면 전체, 아니면 일반)
    @GetMapping("list")
    public ResponseEntity<List<Faq>> getFaqList(@RequestParam(required = false) String userType) {
        try {
            List<Faq> faqList;
            if ("admin".equals(userType)) {
                faqList = service.listAllFAQ(new HashMap<>());
            } else {
                faqList = service.listFAQ(new HashMap<>());
            }
            return ResponseEntity.ok(faqList);
        } catch (Exception e) {  
            return ResponseEntity.internalServerError().build();
        }
    }
    
    // FAQ 삭제하는 메서드임
    // AJAX 요청으로 받은 faqNum으로 FAQ 삭제하고 결과 JSON으로 반환함
    @GetMapping("delete")
    @ResponseBody
    public Map<String, Object> deleteFAQ(@RequestParam Long faqNum) {
        Map<String, Object> response = new HashMap<>();
        try {
            service.deleteFAQ(faqNum);
            response.put("status", "success");
            response.put("message", "FAQ가 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "FAQ 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
        return response;
    }
    
    // FAQ 수정하는 메서드임
    // AJAX 요청으로 받은 FAQ 데이터로 수정하고 결과 JSON으로 반환함
    @PostMapping("update")
    @ResponseBody
    public Map<String, Object> updateFAQ(@RequestBody Faq faq) {
        Map<String, Object> response = new HashMap<>();
        try {
            service.updateFAQ(faq);
            response.put("status", "success");
            response.put("message", "FAQ가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "FAQ 수정 중 오류가 발생했습니다: " + e.getMessage());
        }
        return response;
    }
    
    // 특정 FAQ 정보 가져오는 메서드
    // faqNum으로 FAQ 찾아서 JSON으로 반환함
    // 없으면 404, 에러나면 500 응답 보냄
    @GetMapping("getFaq")
    @ResponseBody
    public ResponseEntity<Faq> getFaq(@RequestParam Long faqNum) {
        try {
            Faq faq = service.getFaqById(faqNum);
            if (faq != null) {
                return ResponseEntity.ok(faq);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}