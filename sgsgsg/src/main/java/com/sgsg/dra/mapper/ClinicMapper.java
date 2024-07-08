package com.sgsg.dra.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Clinic;
import com.sgsg.dra.domain.ClinicAnswer;

@Mapper
public interface ClinicMapper {
	public void insertClinic(Clinic dto) throws SQLException;
	public void updateClinic(Clinic dto) throws SQLException;
	public void deleteClinic(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Clinic> listClinic(Map<String, Object> map);
	
	public Clinic findById(long num);
	public void updateHitCount(long num) throws Exception;
	public Clinic findByPrev(Map<String, Object> map);
	public Clinic findByNext(Map<String, Object> map);
	
	public void insertClinicAnswer(ClinicAnswer dto) throws Exception;
	public int ClinicAnswerCount(Map<String, Object> map);
	public List<ClinicAnswer> listClinicAnswer(Map<String, Object> map);
	public void deleteClinicAnswer(Map<String, Object> map) throws SQLException;
	
	public List<ClinicAnswer> listClinicAnswerComment(Map<String, Object> map);
	public int ClinicAnswerCommentCount(Map<String, Object> map);
	
	public void insertClinicAnswerLike(Map<String, Object> map) throws SQLException;
	public Map<String, Object> ClinicAnswerLikeCount(Map<String, Object> map);
	
	public List<Clinic> listClinicCategory() throws Exception;
	
	

	
}
