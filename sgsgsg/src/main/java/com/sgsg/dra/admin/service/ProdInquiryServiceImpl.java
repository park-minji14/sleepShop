package com.sgsg.dra.admin.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Question;
import com.sgsg.dra.mapper.QuestionMapper;

@Service
public class ProdInquiryServiceImpl  implements ProdInquiryService{
	 @Autowired
	 private QuestionMapper mapper;

	 @Override
	 public List<Question> listAdminInquiries(Map<String, Object> map) {
	     List<Question> inquiryList = null;
	     try {
	         inquiryList = mapper.listQuestion2(map);
	         for (Question inquiry : inquiryList) {
	             inquiry.setAnswerStatus(inquiry.getAnswer_Date() != null ? "답변완료" : "답변대기");
	         }
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	     return inquiryList;
	 }

	    @Override
	    public int getAdminInquiryCount(Map<String, Object> map) {
	        int count = 0;
	        try {
	            count = mapper.dataCount2(map);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return count;
	    }

	    @Override
	    public Question getInquiry(int inquiryNum) {
	        Question question = mapper.getInquiry(inquiryNum);
	        if (question != null) {
	            question.setAnswerStatus(question.getAnswer_Date() != null ? "답변완료" : "답변대기");
	        }
	        return question;
	    }

	    @Override
	    public void saveAnswer(int inquiryNum, String answer, String answerId) throws SQLException {
	        try {
	            Map<String, Object> map = new HashMap<String, Object>();
	            map.put("inquiryNum", inquiryNum);
	            map.put("answer", answer);
	            map.put("answerId", answerId);
	            mapper.saveAnswer(map);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}