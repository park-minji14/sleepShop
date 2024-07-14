package com.sgsg.dra.service;

import com.sgsg.dra.domain.Question;

public interface QuestionService {
	public void insertQuestion(Question dto, String pathname) throws Exception;
}
