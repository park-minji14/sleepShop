package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Faq;

public interface FaqManageService {
    
	public List<Faq> listFAQ(Map<String, Object> map) throws Exception;

    public void insertFAQ(Faq faq) throws Exception;
    
    public void updateFAQ(Faq faq) throws Exception;
    
    public void deleteFAQ(Long faqNum) throws Exception;
}