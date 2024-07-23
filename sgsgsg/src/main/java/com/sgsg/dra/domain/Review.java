package com.sgsg.dra.domain;

public class Review {
	 private long orderDetailNum;
	 private long score;
	 private  String review;
	 private String review_Date;
	 private int showReview;
	 private int locked;
	 
	 private String userId;
	 private String liked_At;
	 
	 private String orderDate;
	 
	 private String thumbnail;
	 
	 private long fileNum;
	 private String fileName;
	 
	 private long productNum;
	 private String productName;
	 private long detailNum;
	 private long detailNum2;
	 
	 private int reviewWrite;
	 
	public long getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(long orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public long getScore() {
		return score;
	}
	public void setScore(long score) {
		this.score = score;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getReview_Date() {
		return review_Date;
	}
	public void setReview_Date(String review_Date) {
		this.review_Date = review_Date;
	}
	public int getShowReview() {
		return showReview;
	}
	public void setShowReview(int showReview) {
		this.showReview = showReview;
	}
	public int getLocked() {
		return locked;
	}
	public void setLocked(int locked) {
		this.locked = locked;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLiked_At() {
		return liked_At;
	}
	public void setLiked_At(String liked_At) {
		this.liked_At = liked_At;
	}
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public long getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}
	public long getDetailNum2() {
		return detailNum2;
	}
	public void setDetailNum2(long detailNum2) {
		this.detailNum2 = detailNum2;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getReviewWrite() {
		return reviewWrite;
	}
	public void setReviewWrite(int reviewWrite) {
		this.reviewWrite = reviewWrite;
	}
	
	 
	 
}
