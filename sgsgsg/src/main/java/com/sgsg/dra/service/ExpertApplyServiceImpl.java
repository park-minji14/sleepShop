package com.sgsg.dra.service;

import com.sgsg.dra.domain.ExpertApply;
import com.sgsg.dra.mapper.ExpertApplyMapper;
import com.sgsg.dra.service.ExpertApplyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExpertApplyServiceImpl implements ExpertApplyService {

    @Autowired
    private ExpertApplyMapper expertApplyMapper;

    @Override
    public void applyExpert(ExpertApply expertApply) {
        expertApplyMapper.insertExpertApply(expertApply);
    }

    @Override
    public ExpertApply getExpertApplyById(long apply_num) {
        return expertApplyMapper.selectExpertApplyById(apply_num);
    }

    @Override
    public List<ExpertApply> getAllExpertApplies() {
        return expertApplyMapper.selectAllExpertApplies();
    }


    @Override
    public void deleteExpertApply(long apply_num) {
        expertApplyMapper.deleteExpertApply(apply_num);
    }
}
