package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.domain.RecentOrderManage;
import com.sgsg.dra.admin.mapper.ChartManageMapper;

@Service
public class ChartManageServiceImpl implements ChartManageService {
	
	@Autowired
	ChartManageMapper mapper;

	@Override
	public List<Map<String, Object>> todayOrder() throws Exception{
		List<Map<String, Object>> list = null;
		try {
			list = mapper.todayOrder();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> todayDelivery() throws Exception{
		List<Map<String, Object>> list = null;
		try {
			list = mapper.todayDelivery();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public List<RecentOrderManage> recentOrder() throws Exception{
		List<RecentOrderManage> list = null;
		try {
			list = mapper.recentOrder();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> weekOrder() throws Exception{
		List<Map<String, Object>> list = null;
		try {
			list = mapper.weekOrder();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> weekDelivery() throws Exception{
		List<Map<String, Object>> list = null;
		try {
			list = mapper.weekDelivery();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> monthOrder() throws Exception {
		List<Map<String, Object>> list = null;
		try {
			list = mapper.monthOrder();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> monthDelivery() throws Exception {
		List<Map<String, Object>> list = null;
		try {
			list = mapper.monthDelivery();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}
	
}
