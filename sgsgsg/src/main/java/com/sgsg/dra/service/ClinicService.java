package com.sgsg.dra.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Clinic;
import com.sgsg.dra.domain.ClinicAnswer;


public interface ClinicService {
	public void insertClinic(Clinic dto, String pathname) throws Exception;
	public void updateClinic(Clinic dto, String pathname) throws Exception;
	public void deleteClinic(long num, String pathname, String userId, int membership)  throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Clinic> listClinic(Map<String, Object> map);
	
	public Clinic findById(long num);
	public Clinic findByPrev(Map<String, Object> map);
	public Clinic findByNext(Map<String, Object> map);
	
	public void insertClinicAnswer(ClinicAnswer dto) throws Exception;
	public void deleteClinicAnswer(Map<String, Object> map) throws Exception;
	public List<ClinicAnswer> listClinicAnswer(Map<String, Object> map);
	public int ClinicAnswerCount(Map<String, Object> map);
	
	public void insertClinicAnswerComment(ClinicAnswer dto) throws Exception;
	public List<ClinicAnswer> listClinicAnswerComment(long num) throws Exception;
	public int ClinicAnswerCommentCount(Map<String, Object> map);
	
	
	ClinicAnswer findLikedAnswer(long num) throws SQLException;
	
	public List<Clinic> listClinicCategory() throws Exception;
	

}
