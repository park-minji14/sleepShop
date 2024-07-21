package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Return;

public interface ReturnManageService {
	public void insertReturnRequest(Map<String, Object> map) throws Exception;
	public List<Return> listReturnRequest(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	
}
