package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Product;

public interface CartService {
	public void inserCart(Product dto) throws Exception;
	public List<Product> selectCartList(String userId) throws Exception;
	public void updateQty(Product dto) throws Exception;
	public void deleteCart(Map<String, Object> map) throws Exception;
}
