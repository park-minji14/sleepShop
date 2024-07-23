package com.sgsg.dra.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Member;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.Product;
import com.sgsg.dra.domain.UserPoint;

@Mapper
public interface OrderMapper {
	public String findByMaxOrderNumber();
	public void insertOrder(Order dto) throws SQLException;
	public void insertOrderDetail(Order dto) throws SQLException;
	public void insertPayDetail(Order dto) throws SQLException;
	public void updateProductStock(Order dto) throws SQLException;
	
	public List<Product> findByStockNum(Map<String, Object> map) throws SQLException;
	
	public void insertDest(Delivery dto) throws SQLException;
	public Delivery findByDest(String userId) throws SQLException;
	public List<Delivery> selectAllDest(String userId) throws SQLException;
	public void updateDefaultDest(String userId) throws SQLException;
	public void updateDest(Delivery dto) throws SQLException;
	public void deleteDest(Map<String, Object> map) throws SQLException;
	
	public void insertUserPoint(UserPoint userPoint) throws SQLException;
	public UserPoint findByUserPoint(String userId) throws SQLException;
	
	public Member findByOrderUser(String userId) throws SQLException;
	
}
