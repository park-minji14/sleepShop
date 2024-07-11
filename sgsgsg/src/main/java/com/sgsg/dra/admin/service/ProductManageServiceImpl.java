package com.sgsg.dra.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sgsg.dra.admin.domain.ProductManage;
import com.sgsg.dra.admin.mapper.ProductManageMapper;
import com.sgsg.dra.common.FileManager;

@Service
public class ProductManageServiceImpl implements ProductManageService {
	@Autowired
	private ProductManageMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertProduct(ProductManage dto, String pathname) throws Exception {
		try {
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);

			long productNum = mapper.productSeq();
			dto.setProductNum(productNum);

			mapper.insertProduct( dto);
			
			//추가적인 이미지
			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if(filename == null) {
						continue;
					}
					dto.setFilename(filename);
					
					mapper.insertProductFile(dto);
				}
			}
			//옵션 추가
			if(dto.getOptionCount() > 0) {
				insertProductOption(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public ProductManage findByCategory(long categoryNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductManage> listCategory() {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ProductManage> listSubCategory(long parentNum) {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listSubCategory(parentNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//옵션
	private void insertProductOption(ProductManage dto) throws Exception {
		try {
			long optionNum = 0, optionNum2 = 0;
			long detailNum;
			
			// 옵션1
			if(dto.getOptionCount() > 0) {
				optionNum = mapper.optionSeq();
				dto.setOptionNum(optionNum);
				dto.setParentOption(null);
				mapper.insertProductOption(dto);
				
				// 옵션1의 값 추가
				dto.setDetailNums(new ArrayList<Long>());
				for(String optionValue : dto.getOptionValues()) {
					detailNum = mapper.detailSeq(); 
					dto.setDetailNum(detailNum);
					dto.setOptionValue(optionValue);
	
					mapper.insertOptionDetail(dto);
					
					dto.getDetailNums().add(detailNum);
				}
			}
			//옵션 2
			if(dto.getOptionCount() > 1) {
				optionNum2 = mapper.optionSeq();
				dto.setOptionNum(optionNum2);
				dto.setOptionName(dto.getOptionName2());
				dto.setParentOption(optionNum);
				mapper.insertProductOption(dto);
				
				// 옵션 2 값 추가
				dto.setDetailNums2(new ArrayList<Long>());
				for(String optionValue2 : dto.getOptionValues2()) {
					detailNum = mapper.detailSeq(); 
					dto.setDetailNum(detailNum);
					dto.setOptionValue(optionValue2);
					mapper.insertOptionDetail(dto);
					
					dto.getDetailNums2().add(detailNum);
				}
			}
		} catch (Exception e) {
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
	public List<ProductManage> listProduct(Map<String, Object> map) {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
