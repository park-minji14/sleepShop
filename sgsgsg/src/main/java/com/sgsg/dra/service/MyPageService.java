package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Inquiry;

public interface MyPageService {
	public int dataCount(Map<String, Object> map);
	public List<Inquiry> listInquiry(Map<String, Object> map);
	public Inquiry findById(long num);
}
