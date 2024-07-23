package com.sgsg.dra.admin.domain;

public class RecentOrderManage {
	private long orderNum;
	private String productOrderName;
	private String userName;
	private String recipientName;
	private long totalMoney;
	private int orderState;
	private String tel;
	private String orderDate;
	
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public String getProductOrderName() {
		return productOrderName;
	}
	public void setProductOrderName(String productOrderName) {
		this.productOrderName = productOrderName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(long totalMoney) {
		this.totalMoney = totalMoney;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
}
