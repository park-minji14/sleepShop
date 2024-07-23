package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.admin.domain.RecentOrderManage;

public interface ChartManageService {
	public List<Map<String, Object>> todayOrder();
	public List<Map<String, Object>> todayDelivery();
	public List<RecentOrderManage> recentOrder();
}
