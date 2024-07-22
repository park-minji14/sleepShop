package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.sgsg.dra.domain.Question;

public interface ProdInquiryService {
    // 관리자용 문의 목록 조회
    public List<Question> listAdminInquiries(Map<String, Object> map);

    // 관리자용 문의 개수 조회
    public int getAdminInquiryCount(Map<String, Object> map);
    
    // 문의 상세 정보 조회
    public Question getInquiry(int inquiryNum);

    // 답변 저장 (파일 포함)
    public void saveAnswer(Question dto) throws Exception;

    // 파일 저장
    public String saveFile(MultipartFile file, String pathname) throws Exception;

    // 파일 정보 조회
    public Question readQuestionFile(long fileNum) throws Exception;

    // 문의 삭제
    public void deleteInquiry(long num, String pathname) throws Exception;

}