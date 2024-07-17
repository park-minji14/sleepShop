package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Order;

@Mapper
public interface OrderManageMapper {
	public List<Order> listOrder() throws SQLException;
	
	public Order findById(String orderNum) throws SQLException;
	public List<Order> findByOrderDetails(String orderNum) throws SQLException;
	
	
}
