package com.sgsg.dra.service;


import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sgsg.dra.domain.Review;
import com.sgsg.dra.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
    
    @Autowired
    private ReviewMapper mapper;

    /**
     * 리뷰 목록을 조회하고 처리하는 메소드
     * @param map 조회 조건을 담은 Map 객체
     * @return 처리된 리뷰 목록
     */
    @Override
    public List<Review> listReviews(Map<String, Object> map) {
        List<Review> list = null;
        
        try {
            list = mapper.listReviews(map);
            
            for (Review dto : list) {
            	
                // 사용자 이름 마스킹 처리
				/* dto.setUsername(maskUsername(dto.getUserName())); */
                
                // 리뷰 내용의 줄바꿈을 <br> 태그로 변환
                dto.setReview(dto.getReview().replaceAll("\n", "<br>"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }

    /**
     * 특정 상품의 총 리뷰 수를 계산하는 메소드
     * @param productNum 상품 번호
     * @return 총 리뷰 수
     */
    @Override
    public int countReviews(long productNum) {
        try {
            return mapper.countReviews(productNum);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 특정 상품의 평균 평점을 계산하는 메소드
     * @param productNum 상품 번호
     * @return 평균 평점
     */
    @Override
    public double getAvgScore(long productNum) {
        try {
            return mapper.getAvgScore(productNum);
        } catch (Exception e) {
            e.printStackTrace();
            return 0.0;
        }
    }

    /**
     * 사용자 이름을 마스킹 처리하는 private 메소드
     * @param username 원본 사용자 이름
     * @return 마스킹 처리된 사용자 이름
     */
	/*
	 * private String maskUsername(String userName) { if (userName == null ||
	 * userName.length() <= 2) { return userName; } return userName.charAt(0) +
	 * "*".repeat(userName.length() - 2) + userName.charAt(userName.length() - 1); }
	 */
}