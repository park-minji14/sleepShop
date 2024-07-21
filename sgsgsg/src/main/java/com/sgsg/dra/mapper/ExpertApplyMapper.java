package com.sgsg.dra.mapper;

import com.sgsg.dra.domain.ExpertApply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExpertApplyMapper {
	public void insertExpertApply(ExpertApply dto) throws Exception;
	
    public ExpertApply selectExpertApply(long apply_num);
    public List<ExpertApply> listExpertApply();
    
    public void deleteExpertApply(long apply_num);
}
