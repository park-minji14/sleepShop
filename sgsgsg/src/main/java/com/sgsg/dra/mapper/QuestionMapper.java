package com.sgsg.dra.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Question;

@Mapper
public interface QuestionMapper {
	public void insertQuestion(Question dto) throws SQLException;
	public void insertQuestionFile(Question dto) throws SQLException;
 
	public int dataCount(Map<String, Object> map);
	public List<Question>listQuestion(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<Question>listQuestion2(Map<String, Object> map);
	
	public void updateQuestion(Question dto) throws SQLException;

	public List<Question>listQuestionFile(long num);
	public void deleteQuestion(long num) throws SQLException;
	
    // 문의 상세 정보 조회
    public Question getInquiry(int inquiryNum);
    // 답변 저장
    public void saveAnswer(Map<String, Object> map) throws SQLException;
}
