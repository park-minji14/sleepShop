package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Member;
import com.sgsg.dra.domain.MyPoint;
import com.sgsg.dra.domain.Review;


public interface MyPageService {
	public int dataCount(Map<String, Object> map);
	public List<MyPoint> listPoint(Map<String, Object> map);
	public MyPoint readPoint(Map<String, Object> map);
	
	
	public int reviewCount(Map<String, Object> map);
	public void insertReview(Review dto, String pathname) throws Exception;
	public void deleteReview(Map<String, Object> map, String pathname) throws Exception;

	public List<Review> listReview(Map<String, Object> map);
	
	public String updateProFile(Member dto, String pathname) throws Exception;	
	public void removeProFile(String userId, String path, String profile);
}
