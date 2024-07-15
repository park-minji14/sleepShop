package com.sgsg.dra.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.mapper.ClinicMapper;
import com.sgsg.dra.common.FileManager;
import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Clinic;
import com.sgsg.dra.domain.ClinicAnswer;

@Service
public class ClinicServiceImpl implements ClinicService {
	@Autowired
	private ClinicMapper mapper;
	
	@Autowired 
	private FileManager fileManager;
	
	@Autowired
	private MyUtil myUtil;
	
	@Override
	public void insertClinic(Clinic dto, String pathname) throws Exception {
		try {
			// 파일
			String saveFilename = 
					fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			// 테이블에 등록
			mapper.insertClinic(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	@Override
	public void updateClinic(Clinic dto, String pathname) throws Exception {
		try {
			String saveFilename = 
					fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				if(dto.getSaveFilename()!=null && dto.getSaveFilename().length()!=0) {
					// 이전 업로드된 파일 지우기
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
				
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			mapper.updateClinic(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	@Override
	public void deleteClinic(long num, String pathname, String userId, int membership) throws Exception {
		try {
			Clinic dto = findById(num);
			if(dto == null || (membership<51 && ! dto.getUserId().equals(userId))) {
				return;
			}
			
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			mapper.deleteClinic(num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Clinic> listClinic(Map<String, Object> map) {
		List<Clinic> list = null;
		
		try {
			list = mapper.listClinic(map);
			
			for(Clinic dto : list) {
				dto.setUserId(myUtil.nameMasking(dto.getUserId()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Clinic findById(long num) {
		Clinic dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public Clinic findByPrev(Map<String, Object> map) {
		Clinic dto = null;
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Clinic findByNext(Map<String, Object> map) {
		Clinic dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void insertClinicAnswer(ClinicAnswer dto) throws Exception {
		try {
			mapper.insertClinicAnswer(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<ClinicAnswer> listClinicAnswer(Map<String, Object> map) {
		List<ClinicAnswer> list = null;
		
		try {
			list = mapper.listClinicAnswer(map);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;	
	}
	

	@Override
	public int ClinicAnswerCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.ClinicAnswerCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteClinicAnswer(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteClinicAnswer(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
    public List<ClinicAnswer> listClinicAnswerComment(long num) throws Exception {
        return mapper.listClinicAnswerComment(num);
    }

	
	@Override
	public int ClinicAnswerCommentCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.ClinicAnswerCommentCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	

	
	
	@Override
	public List<Clinic> listClinicCategory() throws Exception {
		List<Clinic> list = null;
		
		try {
			list = mapper.listClinicCategory();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}


	@Override
	public ClinicAnswer findLikedAnswer(long num) throws SQLException {
		return mapper.findLikedAnswer(num);
	}


	@Override
	public void insertClinicAnswerComment(ClinicAnswer dto) throws Exception {
		try {
			mapper.insertClinicAnswerComment(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	
	


	
	
		

}
