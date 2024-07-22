package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.UserPoint;

@Mapper
public interface OrderManageMapper {
	public List<Order> listOrder(Map<String, Object> map) throws SQLException;
	public int dataCount(Map<String, Object> map) throws SQLException;
	
	public Order findById(String orderNum) throws SQLException;
	public List<Order> findByOrderDetails(String orderNum) throws SQLException;
	
	public List<Order> selectDeliveryCompanyList() throws SQLException;
	public void insertDelivery(Map<String, Object> map) throws SQLException;
	public void updateDeliveryState(Map<String, Object> map) throws SQLException;
	public void updateOrderState(Map<String, Object> map) throws SQLException;
	
	public void cancelOrder(Map<String, Object> map) throws SQLException;
	public UserPoint findByUserPoint(String userId) throws SQLException;
	public void canceleUesdPoint(Map<String, Object> map) throws SQLException;
	public void cancelProductStock(Map<String, Object> map) throws SQLException;
	
	public List<Order> selectOrderStateCount() throws SQLException;
}
