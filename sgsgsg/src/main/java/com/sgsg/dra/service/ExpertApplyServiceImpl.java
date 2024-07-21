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
    public void insertExpertApply(ExpertApply dto) throws Exception {
    	try {
    		expertApplyMapper.insertExpertApply(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
    }

    @Override
    public ExpertApply selectExpertApply(long apply_num) {
        return expertApplyMapper.selectExpertApply(apply_num);
    }

    @Override
    public List<ExpertApply> listExpertApply() {
        return expertApplyMapper.listExpertApply();
    }


    @Override
    public void deleteExpertApply(long apply_num) {
        expertApplyMapper.deleteExpertApply(apply_num);
    }
}
