package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

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
			throw e;
		}
	}

	@Override
	public List<Product> selectCartList(String userId) throws Exception {
		List<Product> list = null;
		
		try {
			list = mapper.selectCartList(userId);
			if (list != null) {
                for (Product product : list) {
                    // 할인된 가격 계산
                    double discountedPrice = product.getPrice() * (1 - product.getDiscountRate() / 100.0);
                    // 백원 단위로 반올림
                    long roundedPrice = Math.round(discountedPrice / 100.0) * 100;
                    product.setSalePrice(roundedPrice);
                }
			}
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public void updateQty(Product dto) throws Exception {
		try {
			mapper.updateQty(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void deleteCart(Map<String, Object> map) throws Exception{
		try {
			mapper.deleteCart(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
