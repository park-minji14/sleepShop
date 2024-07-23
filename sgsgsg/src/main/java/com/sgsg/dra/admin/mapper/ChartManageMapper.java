package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.admin.domain.RecentOrderManage;

@Mapper
public interface ChartManageMapper {
	public List<RecentOrderManage> recentOrder() throws SQLException;
	
	public List<Map<String, Object>> todayOrder() throws SQLException;
	public List<Map<String, Object>> todayDelivery() throws SQLException;
	
	public List<Map<String, Object>> weekOrder() throws SQLException;
	public List<Map<String, Object>> weekDelivery() throws SQLException;
	
	public List<Map<String, Object>> monthOrder() throws SQLException;
	public List<Map<String, Object>> monthDelivery() throws SQLException;
}
