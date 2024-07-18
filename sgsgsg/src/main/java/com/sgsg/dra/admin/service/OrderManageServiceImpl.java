package com.sgsg.dra.admin.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.mapper.OrderManageMapper;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.state.OrderState;

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

	@Override
	public Order findById(String orderNum) throws SQLException {
		Order dto = null;
		
		try {
			dto = mapper.findById(orderNum);
			if(dto != null) {
				dto.setOrderStateNum(OrderState.fromKorean(dto.getOrderState()).ordinal());
			}
		} catch (Exception e) {
			throw e;
		}
		
		return dto;
	}

	@Override
	public List<Order> findByOrderDetails(String orderNum) throws SQLException {
		List<Order> list = null;
		
		try {
			list = mapper.findByOrderDetails(orderNum);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}

}
