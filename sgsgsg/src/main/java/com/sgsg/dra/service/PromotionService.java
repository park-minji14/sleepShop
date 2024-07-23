package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Promotion;

public interface PromotionService {
	public int dataCount(Map<String, Object> map);
	public List<Promotion> listEvent(Map<String, Object> map);
	
	public Promotion findById(long num);
	public Promotion findByPrev(Map<String, Object> map);
	public Promotion findByNext(Map<String, Object> map);
	
	// 이벤트 응모자 등록 / 리스트 / 이벤트 참여 여부
	public void insertEventTakers(Promotion dto) throws Exception;
	public List<Promotion> listEventTakers(long num);
	public boolean userEventTakers(Map<String, Object> map);	
	
	// 이벤트 당첨자 / 리스트
	public Promotion findByEventWinner(Map<String, Object> map);
	public List<Promotion> listEventWinner(long num);

}
