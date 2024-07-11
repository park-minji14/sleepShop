package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.admin.domain.MemberManage;


public interface MemberManageService {
	public int dataCount(Map<String, Object> map);
	public List<MemberManage> listMember(Map<String, Object> map);

	public MemberManage findById(Long memberIdx);
	
	public void updateMembership(Map<String, Object> map) throws Exception;
	
	
}
