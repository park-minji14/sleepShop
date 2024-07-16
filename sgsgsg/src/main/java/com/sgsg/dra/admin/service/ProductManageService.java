package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.admin.domain.ProductManage;
import com.sgsg.dra.admin.domain.ProductStockManage;

public interface ProductManageService {
	public void insertProduct(ProductManage dto, String pathname) throws Exception;
	public void updateProduct(ProductManage dto, String pathname) throws Exception;
	public void updateProductStock(ProductStockManage dto) throws Exception;
	public void deleteProduct(long productNum, String pathname) throws Exception;
	public void deleteProductFile(long fileNum, String pathname) throws Exception;
	public void deleteOptionDetail(long detailNum) throws Exception;
	
	public ProductManage findByCategory(long categoryNum);
	public List<ProductManage> listCategory();
	public List<ProductManage> listSubCategory(long parentNum);
	
	public int dataCount(Map<String, Object> map);
	public List<ProductManage> listProduct(Map<String, Object> map);
	public List<ProductStockManage> listProductStock(Map<String, Object> map);
	public List<ProductManage> listProductForStock(Map<String, Object> map);
	
	public ProductManage findById(long productNum);
	
	public List<ProductManage> listProductFile(long productNum);
	public List<ProductManage> listProductOption(long productNum);
	public List<ProductManage> listOptionDetail(long optionNum);
	
	
}
