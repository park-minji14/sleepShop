package com.sgsg.dra.service;

import java.util.List;

import com.sgsg.dra.domain.ExpertApply;

public interface ExpertApplyService {
	public void applyExpert(ExpertApply expertApply);
    public ExpertApply getExpertApplyById(long apply_num);
    public List<ExpertApply> getAllExpertApplies();
    
    public void deleteExpertApply(long apply_num);

}
