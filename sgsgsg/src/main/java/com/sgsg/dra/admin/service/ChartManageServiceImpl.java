package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.mapper.ChartManageMapper;

@Service
public class ChartManageServiceImpl implements ChartManageService {
	
	@Autowired
	ChartManageMapper mapper;

	@Override
	public List<Map<String, Object>> todayOrder() {
		List<Map<String, Object>> list = null;
		try {
			list = mapper.todayOrder();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> todayDelivery() {
		List<Map<String, Object>> list = null;
		try {
			list = mapper.todayDelivery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> recentOrder() {
		List<Map<String, Object>> list = null;
		try {
			list = mapper.recentOrder();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
