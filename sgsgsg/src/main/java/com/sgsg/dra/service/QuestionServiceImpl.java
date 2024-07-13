package com.sgsg.dra.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sgsg.dra.common.FileManager;
import com.sgsg.dra.domain.Question;
import com.sgsg.dra.mapper.QuestionMapper;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private QuestionMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertQuestion(Question dto, String pathname) throws Exception {
		
		if (dto.getQuestion() == null || dto.getQuestion().isEmpty()) {
		    throw new IllegalArgumentException("Question content cannot be empty");
		}
		
	    try {
	        // 질문 삽입
	        mapper.insertQuestion(dto);
	        System.out.println("Controller received question2: " + dto.getQuestion());
	        
	        // 파일 처리
	        if (dto.getSelectFile() != null && !dto.getSelectFile().isEmpty()) {
	            for (MultipartFile mf : dto.getSelectFile()) {
	                String filename = fileManager.doFileUpload(mf, pathname);
	                if (filename != null) {
	                    Question fileDto = new Question();
	                    fileDto.setInquiryNum(dto.getInquiryNum());
	                    fileDto.setFilename(filename);
	                    mapper.insertQuestionFile(fileDto);
	                }
	            }
	        }
	    } catch (Exception e) {
	        System.err.println("Failed to insert question. Details: " + e.getMessage());
	        e.printStackTrace();
	        throw new RuntimeException("Failed to process the question", e);
	    }
	}
}
