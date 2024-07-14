package com.sgsg.dra.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.Product;
import com.sgsg.dra.domain.UserPoint;

public interface OrderMapper {
	public long productOrderNum() throws SQLException;
	public void insertOrder(Order dto) throws SQLException;
	public void insertOrderDetail(Order dto) throws SQLException;
	public void insertPayDetail(Order dto) throws SQLException;
	public void updateProductStock(Order dto) throws SQLException;
	
	public List<Product> findByStockNum(Map<String, Object> map) throws SQLException;
	
	public Delivery findByDest(String userId) throws SQLException;
	public List<Delivery> selectAllDest(String userId) throws SQLException;
	
	public void insertUserPoint(UserPoint userPoint) throws SQLException;
	public UserPoint findByUserPoint(String userId) throws SQLException;
	
}
