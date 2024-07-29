package com.sgsg.dra.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Member;
import com.sgsg.dra.domain.MyPoint;
import com.sgsg.dra.domain.Review;


@Mapper
public interface MyPageMapper {
	public int dataCount(Map<String, Object> map);
	public List<MyPoint> listPoint(Map<String, Object> map);
	public MyPoint readPoint(Map<String, Object> map);
	
	
	public int reviewCount(Map<String, Object> map);
	public void insertReview(Review dto) throws SQLException;
	public void insertReviewPhoto(Review dto) throws SQLException;
	
	public void deleteReview(Map<String, Object> map) throws Exception;
	public void deleteReviewPhoto(Map<String, Object> map) throws Exception;

	public List<Review> listReview(Map<String, Object> map);
	public List<Review> listReviewPhoto(Map<String, Object> map);
	
	public void updateProFile(Member dto) throws SQLException;
	
	public Map<String, Object> userOrderState(String userId);
	
}
