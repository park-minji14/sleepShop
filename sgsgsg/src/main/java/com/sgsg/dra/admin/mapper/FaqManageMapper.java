package com.sgsg.dra.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Faq;

@Mapper
public interface FaqManageMapper {

    // FAQ 입력
	public void insertFAQ(Faq faq) throws SQLException;

    // FAQ 수정
	public void updateFAQ(Faq faq) throws SQLException;

    // FAQ 삭제
	public void deleteFAQ(Long faqNum) throws SQLException;

    // FAQ 리스트 출력
	public List<Faq> listFAQ(Map<String, Object> map) throws SQLException;
}