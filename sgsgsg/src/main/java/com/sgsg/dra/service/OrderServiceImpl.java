package com.sgsg.dra.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;
	
	@Override
	public void insertOrder(Order dto) throws Exception {

		try {
			mapper.insertOrder(dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public Delivery findByDest(String userId) throws Exception {
		Delivery delivery = null;
		
		try {
			mapper.findByDest(userId);
		} catch (Exception e) {
			throw e;
		}
		return delivery;
	}

}
