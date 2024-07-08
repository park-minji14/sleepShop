package com.sgsg.dra.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Member;
import com.sgsg.dra.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;

	@Override
	public Member loginMember(String userId) {
		Member dto = null;
		try {
			dto = mapper.loginMember(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
