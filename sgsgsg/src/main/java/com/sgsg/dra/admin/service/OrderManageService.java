package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Order;

public interface OrderManageService {
	public List<Order> listOrder(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	
	public Order findById(String orderNum) throws Exception;
	public List<Order> findByOrderDetails(String orderNum) throws Exception;
	
	public List<Order> selectDeliveryCompanyList() throws Exception;
	public void insertDelivery(Map<String, Object> map) throws Exception;
	public void updateDeliveryState(Map<String, Object> map) throws Exception;
	
	public void cancelOrder(Map<String, Object> map) throws Exception;
	
	public List<Order> selectOrderStateCount() throws Exception;
	
}
