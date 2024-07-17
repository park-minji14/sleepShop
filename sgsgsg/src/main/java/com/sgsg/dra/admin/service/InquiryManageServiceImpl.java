package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.domain.InquiryManage;
import com.sgsg.dra.admin.mapper.InquiryManageMapper;




@Service
public class InquiryManageServiceImpl implements InquiryManageService{
	@Autowired
	private InquiryManageMapper mapper;
	
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	
	@Override
	public List<InquiryManage> listInquiry(Map<String, Object> map) {
		List<InquiryManage> list = null;

		try {
			list = mapper.listInquiry(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	@Override
	public InquiryManage findById(long num) {
		InquiryManage dto = null;

		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateAnswer(InquiryManage dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAnswer(long num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInquiry(long num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	
	
}
