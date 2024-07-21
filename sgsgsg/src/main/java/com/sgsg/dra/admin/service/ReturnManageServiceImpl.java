package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.mapper.ReturnManageMapper;
import com.sgsg.dra.domain.Return;

@Service
public class ReturnManageServiceImpl implements ReturnManageService{
	@Autowired
	private ReturnManageMapper mapper;

	@Override
	public void insertReturnRequest(Map<String, Object> map) throws Exception {
		try {
			mapper.insertReturnRequest(map);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<Return> listReturnRequest() throws Exception {
		List<Return> list = null;
		
		try {
			list = mapper.listReturnRequest();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
