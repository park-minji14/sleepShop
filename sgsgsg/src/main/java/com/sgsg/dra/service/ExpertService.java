package com.sgsg.dra.service;

import java.util.List;

import com.sgsg.dra.domain.ClinicAnswer;
import com.sgsg.dra.domain.Expert;

public interface ExpertService {
	
	public Expert getExpertProfile(String userId) throws Exception;
	
    public void updateExpertProfile(Expert dto);
    
    public int getAnswerCount(String userId);
    
    public int getAcceptedAnswerCount(String userId);
    
    public List<ClinicAnswer> getAnswerList(String userId);

}
