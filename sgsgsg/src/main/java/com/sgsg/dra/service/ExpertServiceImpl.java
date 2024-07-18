package com.sgsg.dra.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.ClinicAnswer;
import com.sgsg.dra.domain.Expert;
import com.sgsg.dra.mapper.ExpertMapper;

@Service
public class ExpertServiceImpl implements ExpertService {

    @Autowired
    private ExpertMapper expertMapper;

    @Override
    public Expert getExpertProfile(String userId) throws Exception{
    	Expert dto = null;
    	try {
			dto = expertMapper.getExpertProfile(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return dto;
    }
    
    @Override
    public void updateExpertProfile(Expert dto) {
        expertMapper.updateExpertProfile(dto);
    }
    
    @Override
    public int getAnswerCount(String userId) {
        return expertMapper.getAnswerCount(userId);
    }
    
    @Override
    public int getAcceptedAnswerCount(String userId) {
        return expertMapper.getAcceptedAnswerCount(userId);
    }
    
    
    @Override
    public List<ClinicAnswer> getAnswerList(String userId) {
        return expertMapper.getAnswerList(userId);
    }
}