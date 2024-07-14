package com.sgsg.dra.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Question;

@Mapper
public interface QuestionMapper {
	public void insertQuestion(Question dto) throws SQLException;
	public void insertQuestionFile(Question dto) throws SQLException;
}
