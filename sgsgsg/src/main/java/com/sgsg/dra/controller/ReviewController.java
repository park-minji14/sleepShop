package com.sgsg.dra.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sgsg.dra.domain.Review;
import com.sgsg.dra.service.ReviewService;
import com.sgsg.dra.common.MyUtil;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
    @Autowired
    private ReviewService service;
    
    @Autowired
    private MyUtil myUtil;
    
    @GetMapping("list")
    public String list(
            @RequestParam long productNum,
            @RequestParam(value = "pageNo", defaultValue = "1") int current_page,
            HttpSession session,
            Model model) throws Exception {
        
        try {
            Map<String, Object> map = new HashMap<>();
            
            int size = 5;
            int offset = (current_page - 1) * size;
            if(offset < 0) offset = 0;
            map.put("productNum", productNum);
            map.put("offset", offset);
            map.put("size", size);
            
            // 리뷰 목록 조회
            List<Review> list = service.listReviews(map);
            System.out.println("디버그: 리뷰 목록 크기 - " + list.size());
            if (!list.isEmpty()) {
                System.out.println("디버그: 첫 번째 리뷰 내용 - " + list.get(0).getReview());
            }
            
            // 리뷰 총 개수 조회
            int dataCount = service.countReviews(productNum);
            System.out.println("디버그: 총 리뷰 개수 - " + dataCount);
            
            // 평균 평점 조회
            double avgScore = service.getAvgScore(productNum);
            System.out.println("디버그: 평균 평점 - " + avgScore);
            
            // 페이징 처리
            int total_page = myUtil.pageCount(dataCount, size);
            if (current_page > total_page) {
                current_page = total_page;
            }
            
            String paging = myUtil.pagingMethod(current_page, total_page, "listReview");
            
            // 모델에 데이터 추가
            model.addAttribute("list", list);
            model.addAttribute("dataCount", dataCount);
            model.addAttribute("size", size);
            model.addAttribute("pageNo", current_page);
            model.addAttribute("total_page", total_page);
            model.addAttribute("paging", paging);
            model.addAttribute("avgScore", avgScore);
            
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("디버그: 예외 발생 - " + e.getMessage());
        }
        
        return ".review.list";
    }
}