package com.sgsg.dra.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Product;
import com.sgsg.dra.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService  {
    @Autowired
    private ProductMapper productMapper;
    
    public List<Product> listCategory() {
        return productMapper.selectCategoryList();
        
    }
    @Override
    public List<Product> listProduct() {
        return productMapper.listProduct();
    }

    @Override
    public Product findById(Long productNum) {
        return productMapper.findById(productNum);
    }

    @Override
    public List<Product> listProductFile(Long productNum) {
        return productMapper.listProductFile(productNum);
    }

	
}