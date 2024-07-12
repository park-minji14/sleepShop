package com.sgsg.dra.service;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Order;

public interface OrderService {
	public void insertOrder(Order dto) throws Exception;
	
	public Delivery findByDest(String userId) throws Exception;
}
