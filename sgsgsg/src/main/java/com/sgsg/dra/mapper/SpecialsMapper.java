package com.sgsg.dra.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Specials;
import com.sgsg.dra.domain.SpecialsProduct;

@Mapper
public interface SpecialsMapper {
    
    // 특가/기획 상품 개수 조회
    public int dataCountSpecials(Map<String, Object> map);
    
    // 특가/기획 상품 목록 조회
    public List<Specials> listSpecials(Map<String, Object> map);
    
    // 특정 특가/기획 상품 상세 정보 조회
    public Specials findById(Long specialNum);
    
    // 특가/기획 상품에 포함된 제품 개수 조회
    public int dataCountProduct(Map<String, Object> map);
    
    // 특가/기획 상품에 포함된 제품 목록 조회
    public List<SpecialsProduct> listProduct(Map<String, Object> map);
    
    public List<SpecialsProduct> listSpecialProducts(Map<String, Object> map);
    
    public String getSpecialEndTime();
}