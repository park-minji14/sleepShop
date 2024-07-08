package com.sgsg.dra.mapper;

import java.sql.SQLException;
import java.util.List;

import com.sgsg.dra.domain.Product;

public interface CartMapper {
	public void inserCart(Product dto) throws SQLException;
	public List<Product> selectCartList(String userId) throws SQLException;
}
