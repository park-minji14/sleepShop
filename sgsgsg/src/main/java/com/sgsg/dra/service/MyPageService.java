package com.sgsg.dra.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.MyPoint;
import com.sgsg.dra.domain.Review;


public interface MyPageService {
	public int dataCount(Map<String, Object> map);
	public List<MyPoint> listPoint(Map<String, Object> map);
	public MyPoint readPoint(Map<String, Object> map);
	

	public void insertReview(Review dto) throws SQLException;
	public List<Review> listReview(Map<String, Object> map);
}
