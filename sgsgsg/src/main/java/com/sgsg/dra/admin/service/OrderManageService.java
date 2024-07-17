package com.sgsg.dra.admin.service;

import java.sql.SQLException;
import java.util.List;

import com.sgsg.dra.domain.Order;

public interface OrderManageService {
	public List<Order> listOrder() throws Exception;
	
	public Order findById(String orderNum) throws SQLException;
	public List<Order> findByOrderDetails(String orderNum) throws SQLException;
	
	
}
