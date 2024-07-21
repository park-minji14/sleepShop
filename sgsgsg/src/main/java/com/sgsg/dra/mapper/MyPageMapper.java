package com.sgsg.dra.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sgsg.dra.domain.MyPoint;


@Mapper
public interface MyPageMapper {
	public int dataCount(Map<String, Object> map);
	public List<MyPoint> listPoint(Map<String, Object> map);
	public MyPoint readPoint(Map<String, Object> map);
}
