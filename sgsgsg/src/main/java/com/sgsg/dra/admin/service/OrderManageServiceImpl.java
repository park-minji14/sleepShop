package com.sgsg.dra.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	public List<Order> listOrder(Map<String, Object> map) throws Exception {
		List<Order> orderList = null;
		try {
			orderList = mapper.listOrder(map);
			for (Order order : orderList) {
				order.setOrderStateInfo(OrderState.fromInt(order.getOrderState()).getKorean());
			}
		} catch (Exception e) {
			throw e;
		}
		return orderList;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Order findById(String orderNum) throws SQLException {
		Order dto = null;
		
		try {
			dto = mapper.findById(orderNum);
			
			dto.setOrderStateInfo(OrderState.fromInt(dto.getOrderState()).getKorean());
			
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

	@Override
	public List<Order> selectDeliveryCompanyList() throws Exception {
		List<Order> list = null;
		
		try {
			list = mapper.selectDeliveryCompanyList();
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

}
