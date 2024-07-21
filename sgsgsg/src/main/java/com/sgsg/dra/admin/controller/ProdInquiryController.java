package com.sgsg.dra.admin.controller;

import com.sgsg.dra.admin.service.ProdInquiryService;
import com.sgsg.dra.domain.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("adminManagement/supportManage/*")
public class ProdInquiryController {

    @Autowired
    private ProdInquiryService service;

    @GetMapping("inquiryList")
    public String inquiryList(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            @RequestParam(value = "answerStatus", required = false) String answerStatus,
            Model model) {
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("offset", (page - 1) * size);
            map.put("size", size);
            
            if (answerStatus != null) {
                if (answerStatus.equals("answered")) {
                    map.put("mode", 2); // 답변 완료
                } else if (answerStatus.equals("unanswered")) {
                    map.put("mode", 3); // 미답변
                }
            }

            List<Question> inquiries = service.listAdminInquiries(map);
            int totalCount = service.getAdminInquiryCount(map);

            model.addAttribute("inquiries", inquiries);
            model.addAttribute("totalCount", totalCount);
            model.addAttribute("page", page);
            model.addAttribute("size", size);
            model.addAttribute("answerStatus", answerStatus);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ".adminLeft.support.inquiryList";
    }
    
    @GetMapping("getInquiry")
    @ResponseBody
    public Question getInquiry(@RequestParam int inquiryNum) {
        try {
            return service.getInquiry(inquiryNum);
        } catch (Exception e) {
            e.printStackTrace();  
            return null;  
        }
    }
    @PostMapping("saveAnswer")
    @ResponseBody
    public Map<String, Object> saveAnswer(@RequestParam int inquiryNum, @RequestParam String answer, @RequestParam String answerId) {
        Map<String, Object> result = new HashMap<>();
        try {
            service.saveAnswer(inquiryNum, answer, answerId);
            result.put("status", "success");
        } catch (Exception e) {
            result.put("status", "error");
        }
        return result;
    }
}