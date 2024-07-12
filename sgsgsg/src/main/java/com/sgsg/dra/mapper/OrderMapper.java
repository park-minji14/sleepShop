package com.sgsg.dra.mapper;

import java.sql.SQLException;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Order;

public interface OrderMapper {
	public void insertOrder(Order dto) throws SQLException;
	
	public Delivery findByDest(String userId) throws SQLException;
}
