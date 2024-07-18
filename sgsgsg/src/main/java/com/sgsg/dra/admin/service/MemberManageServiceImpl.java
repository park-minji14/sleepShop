package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.domain.MemberManage;
import com.sgsg.dra.admin.mapper.MemberManageMapper;


@Service
public class MemberManageServiceImpl implements MemberManageService {
	@Autowired
	private MemberManageMapper mapper;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//회원 리스트 
	@Override
	public List<MemberManage> listMember(Map<String, Object> map) {
		List<MemberManage> list = null;
		
		try {
			list = mapper.listMember(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	//memberIdx로 회원 조회
	@Override
	public MemberManage findById(Long memberIdx) {
		MemberManage dto = null;

		try {
			dto = mapper.findById(memberIdx);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	
	// 회원의 멤버십 상태를 업데이트
	@Override
	public void updateMembership(Map<String, Object> map) throws Exception {
		try {
			mapper.updateMembership(map); // 회원 상태 업데이트
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			throw e; // 예외 다시 던지기
		}
	}

	@Override
	public void updateAuthority(Map<String, Object> map) throws Exception {
		try {
			mapper.updateAuthority(map);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			throw e; // 예외 다시 던지기
		}
	}
	
	
}
