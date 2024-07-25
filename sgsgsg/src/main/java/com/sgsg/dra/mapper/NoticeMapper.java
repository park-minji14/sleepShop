package com.sgsg.dra.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Notice;

@Mapper
public interface NoticeMapper {
	public List<Notice> listNotice(Map<String, Object> map) throws SQLException;
	public Notice findById(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map) throws SQLException;
	
	public Notice findByPrev(Map<String, Object> map) throws SQLException;
	public Notice findByNext(Map<String, Object> map) throws SQLException;
}
