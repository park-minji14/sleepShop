package com.sgsg.dra.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Product;
import com.sgsg.dra.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartMapper mapper;

	@Override
	public void inserCart(Product dto) throws Exception {
		try {
			mapper.inserCart(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Product> selectCartList(String userId) throws Exception {
		List<Product> list = null;
		
		try {
			list = mapper.selectCartList(userId);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

}
