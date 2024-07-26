package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.admin.domain.PromotionManage;
import com.sgsg.dra.domain.MyPoint;
import com.sgsg.dra.domain.UserPoint;

public interface PromotionManageService {
	
	public void insertEvent(PromotionManage dto) throws Exception;
	public void updateEvent(PromotionManage dto) throws Exception;
	public void deleteEvent(long num) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<PromotionManage> listEvent(Map<String, Object> map);
	
	public PromotionManage findById(long num);
	public void updateHitCount(long num) throws Exception;
	public PromotionManage findByPrev(Map<String, Object> map);
	public PromotionManage findByNext(Map<String, Object> map);
	
	public List<PromotionManage> listEventTakers(long num);
	
	public void insertEventWinner(PromotionManage dto) throws Exception;
	public List<PromotionManage> listEventWinner(long num);
	
	public void insertPointHistory(MyPoint point) throws Exception;
	
	public UserPoint findByUserPoint(String userId) throws Exception;
}
