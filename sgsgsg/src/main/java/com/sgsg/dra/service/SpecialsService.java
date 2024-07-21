package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Specials;
import com.sgsg.dra.domain.SpecialsProduct;

public interface SpecialsService {
    
    // 특가/기획 상품 개수 조회
    public int dataCountSpecials(Map<String, Object> map);
    
    // 특가/기획 상품 목록 조회
    public List<Specials> listSpecials(Map<String, Object> map);
    
    // 특정 특가/기획 상품 상세 정보 조회
    public Specials findById(long num);
    
    // 특가/기획 상품에 포함된 제품 개수 조회
    public int dataCountProduct(Map<String, Object> map);
    
    // 특가/기획 상품에 포함된 제품 목록 조회
    public List<SpecialsProduct> listProduct(Map<String, Object> map);
}
