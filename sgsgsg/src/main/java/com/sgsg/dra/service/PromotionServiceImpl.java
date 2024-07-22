package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Promotion;
import com.sgsg.dra.mapper.PromotionMapper;

@Service
public class PromotionServiceImpl implements PromotionService {
	@Autowired
	private PromotionMapper mapper;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Promotion> listEvent(Map<String, Object> map) {
		List<Promotion> list = null;
		
		try {
			list = mapper.listEvent(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

	@Override
	public Promotion findById(long num) {
		Promotion dto = null;
		
		try {
			dto = mapper.findById(num);
			
			if(dto != null) {
				dto.setSday(dto.getStartDate().substring(0, 10));
				dto.setStime(dto.getStartDate().substring(11));
				
				dto.setEday(dto.getEndDate().substring(0, 10));
				dto.setEtime(dto.getEndDate().substring(11));
				
				if(dto.getWinningDate() != null && dto.getWinningDate().length() != 0) {
					dto.setWday(dto.getWinningDate().substring(0, 10));
					dto.setWtime(dto.getWinningDate().substring(11));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Promotion findByPrev(Map<String, Object> map) {
		Promotion dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public Promotion findByNext(Map<String, Object> map) {
		Promotion dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public void insertEventTakers(Promotion dto) throws Exception {
		try {
			// 이벤트 응모자 등록
			mapper.insertEventTakers(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Promotion> listEventTakers(long num) {
		List<Promotion> list = null;
		
		try {
			// 이벤트 응모자 목록
			list = mapper.listEventTakers(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean userEventTakers(Map<String, Object> map) {
		boolean result = false;
		try {
			// 이벤트 응모 여부
			Promotion dto = mapper.findByEventTakers(map);
			if(dto != null) {
				result = true; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Promotion findByEventWinner(Map<String, Object> map) {
		Promotion dto = null;
		// 이벤트 당첨 여부
		try {
			dto = mapper.findByEventWinner(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	
	@Override
	public List<Promotion> listEventWinner(long num) {
		List<Promotion> list = null;
		
		try {
			// 이벤트 당첨자 리스트
			list = mapper.listEventWinner(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
