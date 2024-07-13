package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.Product;

public interface OrderService {
	public long productOrderNum() throws Exception;
	public void insertOrder(Order dto) throws Exception;
	
	public List<Product> findByStockNum(Map<String, Object> map) throws Exception;
	
	public Delivery findByDest(String userId) throws Exception;
}
