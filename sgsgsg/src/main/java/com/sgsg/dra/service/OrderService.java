package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Member;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.Product;
import com.sgsg.dra.domain.UserPoint;

public interface OrderService {
	public String productOrderNumber();
	public void insertOrder(Order dto) throws Exception;
	
	public List<Product> findByStockNum(Map<String, Object> map) throws Exception;
	
	public Delivery findByDest(String userId) throws Exception;
	public List<Delivery> selectAllDest(String userId) throws Exception;
	public void upsert(Delivery dto) throws Exception;
	public void deleteDest(Map<String, Object> map) throws Exception;
	
	public UserPoint findByUserPoint(String userId) throws Exception;
	
	public Member findByOrderUser(String userId) throws Exception;
	
}
