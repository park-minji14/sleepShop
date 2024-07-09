package com.sgsg.dra.service;

import java.util.List;

import com.sgsg.dra.domain.Product;

public interface CartService {
	public void inserCart(Product dto) throws Exception;
	public List<Product> selectCartList(String userId) throws Exception;
	public void updateQty(Product dto) throws Exception;
}
