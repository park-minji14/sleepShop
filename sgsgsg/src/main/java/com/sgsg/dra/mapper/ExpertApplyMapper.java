package com.sgsg.dra.mapper;

import com.sgsg.dra.domain.ExpertApply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExpertApplyMapper {
    void insertExpertApply(ExpertApply expertApply);
    ExpertApply selectExpertApplyById(long apply_num);
    List<ExpertApply> selectAllExpertApplies();
    void deleteExpertApply(long apply_num);
}
