package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Notice;

public interface NoticeService {
	public List<Notice> listNotice(Map<String, Object> map) throws Exception;
	public Notice findById(long num) throws Exception;
	
	public int dataCount(Map<String, Object> map) throws Exception;
	
	public Notice findByPrev(Map<String, Object> map) throws Exception;
	public Notice findByNext(Map<String, Object> map) throws Exception;
}
