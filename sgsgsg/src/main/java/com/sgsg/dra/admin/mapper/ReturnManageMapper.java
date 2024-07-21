package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Return;

@Mapper
public interface ReturnManageMapper {
	public void insertReturnRequest(Map<String, Object> map) throws SQLException;
	public List<Return> listReturnRequest(Map<String, Object> map) throws SQLException;
	public int dataCount(Map<String, Object> map) throws SQLException;
	
}
