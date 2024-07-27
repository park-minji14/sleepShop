package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sgsg.dra.common.FileManager;
import com.sgsg.dra.domain.Member;
import com.sgsg.dra.domain.MyPoint;
import com.sgsg.dra.domain.Review;
import com.sgsg.dra.mapper.MyPageMapper;


@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	

	@Override
	public List<MyPoint> listPoint(Map<String, Object> map) {
		List<MyPoint> list = null;
		
		try {
			list = mapper.listPoint(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public MyPoint readPoint(Map<String, Object> map) {
		MyPoint dto = null;
		
		try {
			dto = mapper.readPoint(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	// 리뷰 등록
	@Override
	public void insertReview(Review dto, String pathname) throws Exception {
		try {
			mapper.insertReview(dto);
			
			if(! dto.getImageFiles().isEmpty()) {
				for(MultipartFile mf : dto.getImageFiles()) {
					String filename = fileManager.doFileUpload(mf, pathname);
					if(filename != null) {
						dto.setFileName(filename);
						mapper.insertReviewPhoto(dto);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	//리뷰(구매목록) 리스트
	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list = null;
		
		try {
			list = mapper.listReview(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	//구매목록 개수
	@Override
	public int reviewCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.reviewCount(map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	//리뷰 삭제
	@Override
	public void deleteReview(Map<String, Object> map, String pathname) throws Exception {
		try {
			List<Review> list = mapper.listReviewPhoto(map);
			for(Review dto : list) {
				fileManager.doFileDelete(dto.getFileName(), pathname);			
			}

			mapper.deleteReviewPhoto(map);
			mapper.deleteReview(map);			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public String updateProFile(Member dto, String pathname) throws Exception {
		String filename = null;
		
		try {
			filename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if(filename != null) {
				dto.setProfile(filename);
				mapper.updateProFile(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return filename;
	}


	@Override
	public void removeProFile(String userId, String path, String profile) {
		try {
			fileManager.doFileDelete(profile, path);
			
			Member dto = new Member();
			dto.setUserId(userId);
			dto.setProfile("");
			
			mapper.updateProFile(dto);
			
		} catch (Exception e) {
			
		}
		
	}
	
}
