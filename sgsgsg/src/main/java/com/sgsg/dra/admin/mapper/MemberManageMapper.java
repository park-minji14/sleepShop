package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.admin.domain.MemberManage;
import com.sgsg.dra.domain.Member;

@Mapper
public interface MemberManageMapper {
	public int dataCount(Map<String, Object> map);

	public List<MemberManage> listMember(Map<String, Object> map);

	public MemberManage findById(Long memberIdx);

	public void updateMembership(Map<String, Object> map) throws SQLException;
	public void updateAuthority(Member dto) throws SQLException;	
}
