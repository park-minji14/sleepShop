package com.sgsg.dra.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.mapper.OrderManageMapper;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.UserPoint;
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
	
	@Override
	public void insertDelivery(Map<String, Object> map) throws Exception {
		try {
			mapper.insertDelivery(map);
			mapper.updateOrderState(map);
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Override
	public void updateDeliveryState(Map<String, Object> map) throws Exception {
		try {
			mapper.updateOrderState(map);
			mapper.updateDeliveryState(map);
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Override
	public void cancelOrder(int state, Map<String, Object> map) throws Exception {
		try {
			map.put("orderNum", map.get("orderNum").toString());
			String[] orderDetailNums = map.get("orderDetailNums").toString().split(",");

			if(state == 10) {
				mapper.cancelOrder(map);
				for(int i=0; i<orderDetailNums.length; i++) {
					map.put("orderdetailNum", Integer.parseInt(orderDetailNums[i]));
					mapper.insertRetrunRequest(map);
				}
			} else {
				
				String[] productMoneys = map.get("productMoneys").toString().split(",");

				for(int i=0; i<orderDetailNums.length; i++) {
					map.put("orderdetailNum", Integer.parseInt(orderDetailNums[i]));
					map.put("cancleAmount", Integer.parseInt(productMoneys[i]));
					mapper.insertRetrunRequest(map);
					
				}
			}
			
			// 판매 취소시 사용한 포인트와 재고 돌려두기
			// 반품 접수 등은 확정시 돌려줌
			if(state == 9 && map.get("usedSaved") != null && Integer.parseInt(map.get("usedSaved").toString()) >0){
				UserPoint point = mapper.findByUserPoint(map.get("memberIdx").toString());
				int used = Integer.parseInt(map.get("usedSaved").toString());
				map.put("remain_points", point.getRemain_points() + used);
				map.put("usedSaved", used);
				map.put("userId", point.getUserId());
				mapper.updateUsePoint(map);
				
				
				mapper.cancelProductStock(map);
			}
			
			mapper.updateOrderState(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Order> selectOrderStateCount() throws Exception {
		List<Order> list = null;
		try {
			list = mapper.selectOrderStateCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public void orderConfirmed(Map<String, Object> map) throws Exception {
		
		try {
			int saved = mapper.findSavedMoney(map);
			
			UserPoint point = mapper.findByUserPoint(map.get("memberIdx").toString());
			if(point != null) {
				map.put("remain_points", point.getRemain_points()+saved);
			} else {
				map.put("remain_points", saved);
			}
			map.put("usedSaved", saved);
			
			mapper.updateUsePoint(map);
			mapper.updateOrderState(map);
		} catch (Exception e) {
			throw e;
		}
	}
}
