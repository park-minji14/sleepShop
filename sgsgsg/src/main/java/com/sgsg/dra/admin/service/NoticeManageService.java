package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.admin.domain.NoticeManage;

public interface NoticeManageService {
	public void insertNotice(NoticeManage dto) throws Exception;
	public void updateNotice(NoticeManage dto) throws Exception;
	public void deleteNotice(long num) throws Exception;
	
	public List<NoticeManage> listNotice(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;

	public NoticeManage findById(int num) throws Exception;
}
