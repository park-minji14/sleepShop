package com.sgsg.dra.domain;

public class UserPoint {
	private long num;
	private int change_points;
	private String Reason;
	private String change_date;
	private int remain_points;
	private String userId;
	private String orderNum;
	
	
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
		return Reason;
	}
	public void setReason(String reason) {
		Reason = reason;
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
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
}
