package com.sgsg.dra.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.mapper.OrderManageMapper;
import com.sgsg.dra.domain.Order;

@Service
public class OrderManageServiceImpl implements OrderManageService {

	@Autowired
	private OrderManageMapper mapper;
	
	@Override
	public List<Order> listOrder() throws Exception {
		List<Order> orderList = null;
		try {
			orderList = mapper.listOrder();
		} catch (Exception e) {
			throw e;
		}
		return orderList;
	}

}
