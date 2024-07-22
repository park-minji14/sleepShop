package com.sgsg.dra.admin.controller;

import com.sgsg.dra.admin.service.ProdInquiryService;
import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("adminManagement/supportManage/*")
public class ProdInquiryController {

	@Autowired
	private MyUtil myUtil;
	
    @Autowired
    private ProdInquiryService service;


    @GetMapping("inquiryList")
    public String inquiryList(
            @RequestParam(value = "page", defaultValue = "1") int current_page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            @RequestParam(value = "answerStatus", required = false) String answerStatus,
            Model model) {
        try {
            Map<String, Object> map = new HashMap<>();
            
            if (answerStatus != null) {
                if (answerStatus.equals("answered")) {
                    map.put("mode", 2); // 답변 완료
                } else if (answerStatus.equals("unanswered")) {
                    map.put("mode", 3); // 미답변
                }
            }

            int dataCount = service.getAdminInquiryCount(map);
            int total_page = myUtil.pageCount(dataCount, size);
            
            if (current_page > total_page) {
                current_page = total_page;
            }

            int offset = (current_page - 1) * size;
            if (offset < 0) offset = 0;

            map.put("offset", offset);
            map.put("size", size);

            List<Question> inquiries = service.listAdminInquiries(map);

            String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

            model.addAttribute("inquiries", inquiries);
            model.addAttribute("page", current_page);
            model.addAttribute("dataCount", dataCount);
            model.addAttribute("size", size);
            model.addAttribute("total_page", total_page);
            model.addAttribute("paging", paging);
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
    public Map<String, Object> saveAnswer(
            @RequestParam int inquiryNum,
            @RequestParam String answer,
            @RequestParam String answerId,
            @RequestParam(required = false) MultipartFile file,
            HttpSession session) {
        
        Map<String, Object> result = new HashMap<>();
        String root = session.getServletContext().getRealPath("/");
        String pathname = root + "uploads" + File.separator + "answers";
        
        try {
            Question dto = new Question();
            dto.setInquiryNum(inquiryNum);
            dto.setAnswer(answer);
            dto.setAnswerId(answerId);
            
            // 파일 처리
            if (file != null && !file.isEmpty()) {
                String originalFilename = file.getOriginalFilename();
                String saveFilename = service.saveFile(file, pathname);
                
                dto.setFilename(saveFilename);  
                
                // 파일 정보 로깅
                System.out.println("파일명: " + originalFilename + ", 크기: " + file.getSize());
            } else {
                System.out.println("첨부된 파일이 없습니다.");
            }
            
            service.saveAnswer(dto);
            result.put("status", "success");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", "error");
        }
        
        return result;
    }
}