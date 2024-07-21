package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.MyPoint;
import com.sgsg.dra.mapper.MyPageMapper;


@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageMapper mapper;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	

	@Override
	public List<MyPoint> listPoint(Map<String, Object> map) {
		List<MyPoint> list = null;
		
		try {
			list = mapper.listPoint(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public MyPoint readPoint(Map<String, Object> map) {
		MyPoint dto = null;
		
		try {
			dto = mapper.readPoint(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	
	
}
