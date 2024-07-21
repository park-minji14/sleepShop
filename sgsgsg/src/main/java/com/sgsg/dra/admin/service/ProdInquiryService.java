package com.sgsg.dra.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Question;

public interface ProdInquiryService {
	public List<Question> listAdminInquiries(Map<String, Object> map);
	public int getAdminInquiryCount(Map<String, Object> map);
	
	// 문의 상세 정보 조회
	public Question getInquiry(int inquiryNum);
	 // 답변 저장
	public void saveAnswer(int inquiryNum, String answer, String answerId) throws SQLException;
}
