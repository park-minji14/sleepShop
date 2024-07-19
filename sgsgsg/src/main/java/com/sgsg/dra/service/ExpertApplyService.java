package com.sgsg.dra.service;

import java.util.List;

import com.sgsg.dra.domain.ExpertApply;

public interface ExpertApplyService {
	
	public void insertExpertApply(ExpertApply dto) throws Exception;
	
    public ExpertApply selectExpertApply(long apply_num);
    public List<ExpertApply> listExpertApply();
    
    public void deleteExpertApply(long apply_num);

}
