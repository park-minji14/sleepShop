package com.sgsg.dra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.WishlistService;
import com.sgsg.dra.domain.Wishlist;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/wishlist/*")
public class WishlistController {

    @Autowired
    private WishlistService service;

    @PostMapping("toggle")
    public Map<String, Object> toggleWishlist(@RequestParam Long productNum, HttpSession session) {
        SessionInfo info = (SessionInfo) session.getAttribute("member");
        Map<String, Object> result = new HashMap<>();

        if (info == null) {
            result.put("state", "false");
            result.put("message", "로그인이 필요합니다.");
            return result;
        }

        try {
            Map<String, Object> toggleResult = service.toggleWishlist(info.getUserId(), productNum);
            result.put("state", "true");
            result.put("isAdded", toggleResult.get("isAdded"));
            result.put("bookmarkCount", toggleResult.get("bookmarkCount"));
        } catch (Exception e) {
            result.put("state", "false");
            result.put("message", "북마크 처리 중 오류가 발생했습니다.");
        }
        
        return result;
    }
    
    // 로그인한 사용자의 특정 상품 북마크 상태와 해당 상품의 전체 북마크 수를 조회하는 메소드임
    @GetMapping("status")
    public Map<String, Object> getWishlistStatus(@RequestParam Long productNum, HttpSession session) {
        SessionInfo info = (SessionInfo) session.getAttribute("member");
        Map<String, Object> result = new HashMap<>();

        if (info == null) {
            result.put("state", "false");
            result.put("message", "로그인이 필요합니다.");
            return result;
        }

        try {
            boolean isBookmarked = service.isInWishlist(info.getUserId(), productNum);
            int bookmarkCount = service.getProductWishlistCount(productNum);
            
            result.put("state", "true");
            result.put("isBookmarked", isBookmarked);
            result.put("bookmarkCount", bookmarkCount);
        } catch (Exception e) {
            result.put("state", "false");
            result.put("message", "북마크 상태 조회 중 오류가 발생했습니다.");
        }
        
        return result;
    }

    @GetMapping("list")
    public Map<String, Object> getWishlist(HttpSession session) {
        SessionInfo info = (SessionInfo) session.getAttribute("member");
        Map<String, Object> result = new HashMap<>();

        if (info == null) {
            result.put("state", "false");
            result.put("message", "로그인이 필요합니다.");
            return result;
        }

        try {
            List<Wishlist> wishlist = service.listWishlist(info.getUserId());
            int count = service.getWishlistCount(info.getUserId());
            
            result.put("state", "true");
            result.put("wishlist", wishlist);
            result.put("count", count);
        } catch (Exception e) {
            result.put("state", "false");
            result.put("message", "위시리스트 조회 중 오류가 발생했습니다.");
        }
        
        return result;
    }
}