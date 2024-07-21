package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.domain.NoticeManage;
import com.sgsg.dra.admin.mapper.NoticeManageMapper;

@Service
public class NoticeManageServiceImpl implements NoticeManageService{
	
	@Autowired
	private NoticeManageMapper mapper;

	@Override
	public void insertNotice(NoticeManage dto) throws Exception {
		try {
			mapper.insertNotice(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<NoticeManage> listNotice(Map<String, Object> map) throws Exception {
		List<NoticeManage> list = null;
		
		try {
			list = mapper.listNotice(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
			
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	public NoticeManage findById(int num) throws Exception {
		NoticeManage dto = null;
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return dto;
	}

	@Override
	public void updateNotice(NoticeManage dto) throws Exception {
		try {
			mapper.updateNotice(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteNotice(long num) throws Exception {
		try {
			mapper.deleteNotice(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	
}
