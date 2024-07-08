package com.sgsg.dra.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Product;

@Mapper
public interface ProductMapper {
	
	//카테고리 이름/아이콘 리스트
	List<Product> selectCategoryList();

    List<Product> listProduct();
    Product findById(Long productNum);
    List<Product> listProductFile(Long productNum);
	
}
