package com.sgsg.dra.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Promotion;

@Mapper
public interface PromotionMapper {
	public int dataCount(Map<String, Object> map);
	public List<Promotion> listEvent(Map<String, Object> map);

	public Promotion findById(long num);
	public Promotion findByPrev(Map<String, Object> map);
	public Promotion findByNext(Map<String, Object> map);

	// 이벤트 응모자 등록 / 리스트 / 이벤트 참여 여부
	public void insertEventTakers(Promotion dto) throws SQLException;
	public Promotion findByEventTakers(Map<String, Object> map);
	public List<Promotion> listEventTakers(long num);
	
	// 이벤트 당첨자 / 리스트
	public Promotion findByEventWinner(Map<String, Object> map);
	public List<Promotion> listEventWinner(long num);
	
	
	
	

}
