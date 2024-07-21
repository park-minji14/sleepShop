package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.admin.domain.NoticeManage;

@Mapper
public interface NoticeManageMapper {
	public void insertNotice(NoticeManage dto) throws SQLException;
	public void updateNotice(NoticeManage dto) throws SQLException;
	public void deleteNotice(long num) throws SQLException;
	public List<NoticeManage> listNotice(Map<String, Object> map) throws SQLException;
	
	public int dataCount(Map<String, Object> map) throws SQLException;
	public NoticeManage findById(int num) throws SQLException;
	
}
