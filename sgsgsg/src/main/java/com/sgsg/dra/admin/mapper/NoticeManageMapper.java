package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.admin.domain.NoticeManage;

@Mapper
public interface NoticeManageMapper {
	public void insertNotice(NoticeManage dto) throws SQLException;
}
