package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.Product;
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
	public List<Product> findByStockNum(Map<String, Object> map) throws Exception {
		List<Product> product = null;
		try {
			product = mapper.findByStockNum(map);
		} catch (Exception e) {
			throw e;
		}
		
		return product;
	}
	

	@Override
	public Delivery findByDest(String userId) throws Exception {
		Delivery delivery = null;

		try {
			delivery = mapper.findByDest(userId);
		} catch (Exception e) {
			throw e;
		}
		return delivery;
	}



}
