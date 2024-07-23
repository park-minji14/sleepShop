package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.admin.domain.RecentOrderManage;

public interface ChartManageService {
	public List<Map<String, Object>> todayOrder() throws Exception;
	public List<Map<String, Object>> todayDelivery() throws Exception;
	public List<RecentOrderManage> recentOrder() throws Exception;
	
	public List<Map<String, Object>> weekOrder() throws Exception;
	public List<Map<String, Object>> weekDelivery() throws Exception;
	
	public List<Map<String, Object>> monthOrder() throws Exception;
	public List<Map<String, Object>> monthDelivery() throws Exception;
}
