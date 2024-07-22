package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChartManageMapper {
	public List<Map<String, Object>> todayOrder() throws SQLException;
	public List<Map<String, Object>> todayDelivery() throws SQLException;
}
