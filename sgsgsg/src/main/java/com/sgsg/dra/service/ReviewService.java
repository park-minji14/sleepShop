package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Review;

public interface ReviewService {
	
    // 특정 상품의 리뷰 목록 불러오기
    public List<Review> listReviews(Map<String, Object> map);
    
    // 특정 상품의 리뷰 갯수 불러오기
    public int countReviews(long productNum);
    
    // 특정 상품의 평균 평점 가져오기
    public double getAvgScore(long productNum);

}
