package com.sgsg.dra.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.ClinicAnswer;
import com.sgsg.dra.domain.Expert;

@Mapper
public interface ExpertMapper {

    public Expert getExpertProfile(String userId) throws SQLException;

    public void updateExpertProfile(Expert dto);
    
    public int getAnswerCount(String userId);
    
    public int getAcceptedAnswerCount(String userId);
    
    public List<ClinicAnswer> getAnswerList(String userId);
}
