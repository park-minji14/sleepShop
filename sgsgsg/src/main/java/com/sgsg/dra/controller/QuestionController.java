package com.sgsg.dra.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
    public Map<String, Object> createQuestion(Question dto, HttpSession session) throws Exception {
        String root = session.getServletContext().getRealPath("/");
        String pathname = root + "uploads" + File.separator + "question";
        String state = "true";
        
        try {
            SessionInfo info = (SessionInfo) session.getAttribute("member");
            dto.setUserId(info.getUserId());
            
            // 파일 정보 로깅
            if (dto.getSelectFile() != null && !dto.getSelectFile().isEmpty()) {
                for (MultipartFile file : dto.getSelectFile()) {
                    System.out.println("파일명: " + file.getOriginalFilename() + ", 크기: " + file.getSize());
                }
            } else {
                System.out.println("첨부된 파일이 없습니다.");
            }
            
            service.insertQuestion(dto, pathname);
            
        } catch (Exception e) {
            state = "false";
            e.printStackTrace();  
        }
        
        Map<String, Object> model = new HashMap<>();
        model.put("state", state);
        return model;
    }

    //상품 페이지의 문의 리스트 
    @GetMapping("list")
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(value = "productNum") long productNum,
            @RequestParam(value = "pageNo", defaultValue = "1") int current_page, 
            HttpSession session) throws Exception {
        SessionInfo info = (SessionInfo) session.getAttribute("member");
        Map<String, Object> model = new HashMap<String,Object>();

        try {
            Map<String, Object> map = new HashMap<String,Object>();
            int size = 5;
            int dataCount = 0;
            map.put("productNum", productNum);
            dataCount = service.dataCount(map);
            int total_page = myUtil.pageCount(dataCount, size);
            if (current_page > total_page) {
                current_page = total_page;
            }
            int offset = (current_page - 1) * size;
            if (offset < 0) offset = 0;
            map.put("offset", offset);
            map.put("size", size);
            
            List<Question> list = service.listQuestion(map);
            for (Question dto : list) {         
                if (dto.getAnswer() != null && !dto.getAnswer().isEmpty()) {
                    dto.setAnswerStatus("답변완료");
                } else {
                    dto.setAnswerStatus("답변대기");
                }

                boolean canViewFullContent = dto.getSecret() == 0 || // 비밀글이 아니면 누구나 볼 수 있음
                	    (info != null && (info.getMembership() >= 50 || dto.getUserId().equals(info.getUserId())));

                	if (!canViewFullContent) {
                	    dto.setQuestion("비공개 문의글 <img src='https://img.icons8.com/ios/20/000000/lock--v1.png' alt='lock'>");
                	    if (dto.getAnswer() != null && !dto.getAnswer().isEmpty()) {
                	        dto.setAnswer("답변이 등록되었습니다.");
                	    }
                	    // 파일 존재 여부만 표시
                	    if (dto.getListFilename() != null && dto.getListFilename().length > 0) {
                	        dto.setListFilename(new String[]{"[첨부파일]"});
                	    }
                	}
            }
            
            String paging = myUtil.pagingFunc(current_page, total_page, "listQuestion");
            model.put("list", list);
            model.put("dataCount", dataCount);
            model.put("size", size);
            model.put("pageNo", current_page);
            model.put("paging", paging);
            model.put("total_page", total_page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return model;
    }
    
    //마이페이지 상품문의 섹션 
    @GetMapping("list2")
    public Map<String, Object> list2(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
            HttpSession session) throws Exception {
        SessionInfo info = (SessionInfo) session.getAttribute("member");

        Map<String, Object> model = new HashMap<String, Object>();

        try {
            Map<String, Object> map = new HashMap<String, Object>();
        
            int size = 5;
            int dataCount = 0;
            
            map.put("memberIdx", info.getMemberIdx());

            dataCount = service.dataCount2(map);
            int total_page = myUtil.pageCount(dataCount, size);
            if (current_page > total_page) {
                current_page = total_page;
            }

            int offset = (current_page - 1) * size;
            if (offset < 0) offset = 0;

            map.put("offset", offset);
            map.put("size", size);

            List<Question> list = service.listQuestion2(map);

            for (Question dto : list) {
                if (dto.getAnswer() != null && !dto.getAnswer().isEmpty()) {
                    dto.setAnswerStatus("답변완료");
                } else {
                    dto.setAnswerStatus("답변대기");
                }
            }

            String paging = myUtil.pagingFunc(current_page, total_page, "listQuestion");

            model.put("list", list);
            model.put("dataCount", dataCount);
            model.put("size", size);
            model.put("pageNo", current_page);
            model.put("paging", paging);
            model.put("total_page", total_page);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return model;
    }
}