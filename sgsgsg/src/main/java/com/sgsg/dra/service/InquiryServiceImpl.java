package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Inquiry;
import com.sgsg.dra.mapper.InquiryMapper;

@Service
public class InquiryServiceImpl implements InquiryService {
	@Autowired
	private InquiryMapper mapper;
	
	
	@Override
	public List<Inquiry> listInquiry(Map<String, Object> map) {
		List<Inquiry> list = null;

		try {
			list = mapper.listInquiry(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
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
	public void insertInquiry(Inquiry dto) throws Exception {
		try {
			mapper.insertInquiry(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public void deleteInquiry(long num) throws Exception {
		try {
			mapper.deleteInquiry(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	
	
	@Override
	public Inquiry findById(long num) {
		Inquiry dto = null;

		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	

}
