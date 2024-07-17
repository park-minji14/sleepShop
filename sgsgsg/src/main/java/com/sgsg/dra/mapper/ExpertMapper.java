package com.sgsg.dra.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Expert;

@Mapper
public interface ExpertMapper {

    public Expert getExpertProfile(String userId) throws SQLException;

    public void updateExpertProfile(Expert dto);
    
    public int getAnswerCount(String userId);
}
