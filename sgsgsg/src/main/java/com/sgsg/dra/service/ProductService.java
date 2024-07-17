package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Product;

public interface ProductService {

	public List<Product> selectCategoryList();
	public List<Product> listProduct();

	public int dataCount(Map<String, Object> map);
	public List<Product> listProduct(Map<String, Object> map);

	public Product findById(long productNum);
	public List<Product> listProductFile(long productNum);

	public List<Product> listAllCategory();
	public List<Product> listCategory();
	public List<Product> listSubCategory(long parentNum);
	
	public List<Product> listProductOption(long productNum);
	public List<Product> listOptionDetail(long optionNum);
	public List<Product> listOptionDetailStock(Map<String, Object> map);
	
	public Product getCategoryById(long categoryNum);
	public List<Product> getProductsByCategory(long categoryNum);
	
	public List<Product> searchProducts(Map<String, Object> map);
	public int searchProductsCount(Map<String, Object> map);
	
	


    }

