package com.sgsg.dra.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Review;

@Mapper
public interface ReviewMapper {
	public void insertReview(Review dto) throws SQLException;
	
		
}
