package com.sgsg.dra.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.Product;

@Mapper
public interface CartMapper {
	public void inserCart(Product dto) throws SQLException;
	public List<Product> selectCartList(String userId) throws SQLException;
	public void updateQty(Product dto) throws SQLException;
	public void deleteCart(Map<String, Object> map) throws SQLException;
}
