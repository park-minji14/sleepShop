package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.admin.domain.PromotionManage;
import com.sgsg.dra.domain.MyPoint;
import com.sgsg.dra.domain.UserPoint;

@Mapper
public interface PromotionManageMapper {
	public void insertEvent(PromotionManage dto) throws SQLException;
	public void updateEvent(PromotionManage dto) throws SQLException;
	public void deleteEvent(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<PromotionManage> listEvent(Map<String, Object> map);

	public PromotionManage findById(long num);
	public void updateHitCount(long num) throws SQLException;
	public PromotionManage findByPrev(Map<String, Object> map);
	public PromotionManage findByNext(Map<String, Object> map);

	// 이벤트 응모자 리스트
	public List<PromotionManage> listEventTakers(long num);
	
	// 이벤트 당첨자 등록(발표)
	public void insertEventWinner1(PromotionManage dto) throws SQLException;
	public void insertEventWinner2(PromotionManage dto) throws SQLException;
	// 이벤트 당첨자 리스트
	public List<PromotionManage> listEventWinner(long num);
	
	
	public void insertPointHistory(MyPoint point) throws SQLException;
	
	public UserPoint findByUserPoint(String userId) throws SQLException;

}
