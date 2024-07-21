package com.sgsg.dra.domain;

public class MyPoint {
	private long num;
	private int change_points;
	private String reason;
	private String change_date;
	private int remain_points;
	private String userId;
	private int orderNum;
	private String productOrderName;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public int getChange_points() {
		return change_points;
	}
	public void setChange_points(int change_points) {
		this.change_points = change_points;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getChange_date() {
		return change_date;
	}
	public void setChange_date(String change_date) {
		this.change_date = change_date;
	}
	public int getRemain_points() {
		return remain_points;
	}
	public void setRemain_points(int remain_points) {
		this.remain_points = remain_points;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getProductOrderName() {
		return productOrderName;
	}
	public void setProductOrderName(String productOrderName) {
		this.productOrderName = productOrderName;
	}

	
}
