package com.sgsg.dra.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sgsg.dra.common.FileManager;
import com.sgsg.dra.domain.Question;
import com.sgsg.dra.mapper.QuestionMapper;

@Service
public class ProdInquiryServiceImpl implements ProdInquiryService {
    @Autowired
    private QuestionMapper mapper;

    @Autowired
    private FileManager fileManager;

    @Override
    public List<Question> listAdminInquiries(Map<String, Object> map) {
        List<Question> inquiryList = null;
        try {
            inquiryList = mapper.listQuestion2(map);
            for (Question inquiry : inquiryList) {
                inquiry.setAnswerStatus(inquiry.getAnswer_Date() != null ? "답변완료" : "답변대기");
                
                if (inquiry.getFilename() != null) {
                    inquiry.setListFilename(inquiry.getFilename().split(","));
                }
                
                inquiry.setQuestion(inquiry.getQuestion().replaceAll("\n", "<br>"));
                if (inquiry.getAnswer() != null) {
                    inquiry.setAnswer(inquiry.getAnswer().replaceAll("\n", "<br>"));
                }
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
        Question question = null;
        try {
            question = mapper.getInquiry(inquiryNum);
            if (question != null) {
                question.setAnswerStatus(question.getAnswer_Date() != null ? "답변완료" : "답변대기");
                
                // 파일 정보 조회
                List<Question> files = mapper.listQuestionFile(question.getInquiryNum());
                if (files != null && !files.isEmpty()) {
                    List<String> filenames = new ArrayList<>();
                    for (Question file : files) {
                        if (file.getFilename() != null) {
                            filenames.add(file.getFilename());
                        }
                    }
                    question.setFilename(String.join(",", filenames));
                    question.setListFilename(filenames.toArray(new String[0]));
                } else {
                    question.setFilename(null);
                    question.setListFilename(null);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return question;
    }

    @Override
    public void saveAnswer(Question dto) throws Exception {
        try {
            mapper.updateQuestion(dto);
            
            if (dto.getSelectFile() != null && !dto.getSelectFile().isEmpty()) {
                String pathname = "path/to/answer/files"; // 다운로드 경로..
                for (MultipartFile file : dto.getSelectFile()) {
                    String saveFilename = fileManager.doFileUpload(file, pathname);
                    if (saveFilename != null) {
                        dto.setFilename(saveFilename);
                        mapper.insertQuestionFile(dto);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("답변 저장 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    @Override
    public String saveFile(MultipartFile file, String pathname) throws Exception {
        String saveFilename = null;
        try {
            saveFilename = fileManager.doFileUpload(file, pathname);
            if (saveFilename == null) {
                throw new Exception("파일 저장에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("파일 저장 중 오류가 발생했습니다: " + e.getMessage());
        }
        return saveFilename;
    }


    @Override
    public Question readQuestionFile(long fileNum) throws Exception {
        Question dto = null;
        try {
            dto = mapper.listQuestionFile(fileNum).get(0);
            if (dto == null) {
                throw new Exception("해당 파일 정보를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("파일 정보 조회 중 오류가 발생했습니다: " + e.getMessage());
        }
        return dto;
    }


    @Override
    public void deleteInquiry(long num, String pathname) throws Exception {
        try {
            // 첨부 파일 삭제
            List<Question> listFile = mapper.listQuestionFile(num);
            if (listFile != null) {
                for (Question dto : listFile) {
                    fileManager.doFileDelete(dto.getFilename(), pathname);
                }
            }
            
            // 데이터베이스에서 문의 삭제
            mapper.deleteQuestion(num);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("문의 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
}