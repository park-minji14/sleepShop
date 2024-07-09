package com.sgsg.dra.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.admin.domain.MemberManage;




@Mapper
public interface MemberManageMapper {
	public int dataCount(Map<String, Object> map);
	public List<MemberManage> listMember(Map<String, Object> map);
	
	

}
