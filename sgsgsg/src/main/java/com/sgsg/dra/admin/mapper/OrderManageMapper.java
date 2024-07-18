package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Order;

@Mapper
public interface OrderManageMapper {
	public List<Order> listOrder(Map<String, Object> map) throws SQLException;
	
	public Order findById(String orderNum) throws SQLException;
	public List<Order> findByOrderDetails(String orderNum) throws SQLException;
	
	public List<Order> selectDeliveryCompanyList() throws SQLException;
	
	
}
