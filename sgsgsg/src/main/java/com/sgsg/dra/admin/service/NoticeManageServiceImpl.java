package com.sgsg.dra.admin.service;

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
	
}
