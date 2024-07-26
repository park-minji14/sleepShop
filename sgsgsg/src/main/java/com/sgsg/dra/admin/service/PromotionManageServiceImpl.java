package com.sgsg.dra.admin.service;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.mapper.PromotionManageMapper;
import com.sgsg.dra.domain.MyPoint;
import com.sgsg.dra.domain.UserPoint;
import com.sgsg.dra.admin.domain.PromotionManage;

@Service
public class PromotionManageServiceImpl implements PromotionManageService {
	@Autowired
	private PromotionManageMapper mapper;
	
	@Override
	public void insertEvent(PromotionManage dto) throws Exception {
		try {
			dto.setStartDate(dto.getSday() + " " + dto.getStime() + ":00");
			dto.setEndDate(dto.getEday() + " " + dto.getEtime() + ":00");
			if(dto.getWinnerNumber() !=0 && dto.getWday().length() != 0 && dto.getWtime().length() != 0) {
				dto.setWinningDate(dto.getWday() + " " + dto.getWtime() + ":00");
			}
			mapper.insertEvent(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateEvent(PromotionManage dto) throws Exception {
		try {
			dto.setStartDate(dto.getSday() + " " + dto.getStime() + ":00");
			dto.setEndDate(dto.getEday() + " " + dto.getEtime() + ":00");
			if(dto.getWinnerNumber() !=0 && dto.getWday().length() != 0 && dto.getWtime().length() != 0) {
				dto.setWinningDate(dto.getWday() + " " + dto.getWtime() + ":00");
			}
			
			mapper.updateEvent(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteEvent(long num) throws Exception {
		try {
			mapper.deleteEvent(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

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
	public List<PromotionManage> listEvent(Map<String, Object> map) {
		List<PromotionManage> list = null;
		
		try {
			list = mapper.listEvent(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public PromotionManage findById(long num) {
		PromotionManage dto = null;
		
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
	public PromotionManage findByPrev(Map<String, Object> map) {
		PromotionManage dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public PromotionManage findByNext(Map<String, Object> map) {
		PromotionManage dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<PromotionManage> listEventTakers(long num) {
		List<PromotionManage> list = null;
		
		try {
			// 이벤트 응모자 목록
			list = mapper.listEventTakers(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertEventWinner(PromotionManage dto) throws Exception {
		try {
			
			if(dto.getWinEvent() == 1) {
				// 순위 없는 당첨자 발표
				mapper.insertEventWinner1(dto);
			} else {
				// 순위별 당첨자 발표
				List<PromotionManage> list = listEventTakers(dto.getEvent_num());
				Collections.shuffle(list);
				
				int idx = 0;
				jump:
				for(int i = 0; i < dto.getRankNum().size(); i++) {
					for(int j = 0; j < dto.getRankNum().get(i); j++ ) {
						if(idx >= list.size()) {
							break jump;
						}
						
						dto.setUserId(list.get(idx).getUserId());
						dto.setRank(dto.getRankNum().get(i));
						
						mapper.insertEventWinner2(dto);
						
						idx++;
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<PromotionManage> listEventWinner(long num) {
		List<PromotionManage> list = null;
		
		try {
			// 이벤트 당첨자 리스트
			list = mapper.listEventWinner(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	@Override
    public void insertPointHistory(MyPoint point) throws Exception {
        try {
            mapper.insertPointHistory(point);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
	
	@Override
	public UserPoint findByUserPoint(String userId) throws Exception {
		UserPoint point = null;
		
		try {
			point = mapper.findByUserPoint(userId);
		} catch (Exception e) {
			throw e;
		}
		return point;
	}

}
