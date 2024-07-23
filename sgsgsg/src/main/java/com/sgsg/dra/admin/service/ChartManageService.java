package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

public interface ChartManageService {
	public List<Map<String, Object>> todayOrder();
	public List<Map<String, Object>> todayDelivery();
	public List<Map<String, Object>> recentOrder();
}
