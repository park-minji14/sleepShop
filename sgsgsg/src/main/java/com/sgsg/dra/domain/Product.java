package com.sgsg.dra.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private long categoryNum;
	private String categoryName;
	private String productName;
	private int displayNo;
	private int is_active;
	private long parent_categoryNum;
	private String categoryImage;
	private String userId;
	
	private long productNum;
	private int classify;
	private int price;
	private int salePrice;
	private int discountRate;
	private int savedMoney;
	private int delivery;
	private int optionCount;
	private String content;
	private String thumbnail;

	
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	private int productShow;
	private String reg_date;
	private String update_date;
	private String search_word;
	
	// 옵션
	private long optionNum;
	private long optionNum2;
	private String optionName;
	private String optionName2;
	private long parentNum;
	
	private long detailNum;
	private String optionValue;
	private long detailNum2;
	private String optionValue2;
	
	// 재고
	private long stockNum;
	private int totalStock;
	
	// 이미지
	private long fileNum;
	private String img_name;
	
	// 특가
	private long specialNum;
	private String subject;
	private String iamgeFilename;
	private String startDate;
	private String endDate;
	private int showDetail;
	private int showSpecial;
	private int displayOrder;
	
	// 장바구니
	private long cartNum;
	private int qty;
	
	// 선물
	private long gift_num;
	private long userId2;
	private int quantity;
	private String status;
	
	
	public long getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getDisplayNo() {
		return displayNo;
	}

	public void setDisplayNo(int displayNo) {
		this.displayNo = displayNo;
	}

	public int getIs_active() {
		return is_active;
	}

	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}

	public long getParent_categoryNum() {
		return parent_categoryNum;
	}

	public void setParent_categoryNum(long parent_categoryNum) {
		this.parent_categoryNum = parent_categoryNum;
	}

	public String getCategoryImage() {
		return categoryImage;
	}

	public void setCategoryImage(String categoryImage) {
		this.categoryImage = categoryImage;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getProductNum() {
		return productNum;
	}

	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}

	public int getClassify() {
		return classify;
	}

	public void setClassify(int classify) {
		this.classify = classify;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public int getSavedMoney() {
		return savedMoney;
	}

	public void setSavedMoney(int savedMoney) {
		this.savedMoney = savedMoney;
	}

	public int getDelivery() {
		return delivery;
	}

	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

	public int getOptionCount() {
		return optionCount;
	}

	public void setOptionCount(int optionCount) {
		this.optionCount = optionCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getProductShow() {
		return productShow;
	}

	public void setProductShow(int productShow) {
		this.productShow = productShow;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getSearch_word() {
		return search_word;
	}

	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}

	public long getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(long optionNum) {
		this.optionNum = optionNum;
	}

	public long getOptionNum2() {
		return optionNum2;
	}

	public void setOptionNum2(long optionNum2) {
		this.optionNum2 = optionNum2;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getOptionName2() {
		return optionName2;
	}

	public void setOptionName2(String optionName2) {
		this.optionName2 = optionName2;
	}

	public long getParentNum() {
		return parentNum;
	}

	public void setParentNum(long parentNum) {
		this.parentNum = parentNum;
	}

	public long getDetailNum() {
		return detailNum;
	}

	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}

	public String getOptionValue() {
		return optionValue;
	}

	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}

	public long getDetailNum2() {
		return detailNum2;
	}

	public void setDetailNum2(long detailNum2) {
		this.detailNum2 = detailNum2;
	}

	public String getOptionValue2() {
		return optionValue2;
	}

	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
	}

	public long getStockNum() {
		return stockNum;
	}

	public void setStockNum(long stockNum) {
		this.stockNum = stockNum;
	}

	public int getTotalStock() {
		return totalStock;
	}

	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}

	public long getFileNum() {
		return fileNum;
	}

	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public long getSpecialNum() {
		return specialNum;
	}

	public void setSpecialNum(long specialNum) {
		this.specialNum = specialNum;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getIamgeFilename() {
		return iamgeFilename;
	}

	public void setIamgeFilename(String iamgeFilename) {
		this.iamgeFilename = iamgeFilename;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getShowDetail() {
		return showDetail;
	}

	public void setShowDetail(int showDetail) {
		this.showDetail = showDetail;
	}

	public int getShowSpecial() {
		return showSpecial;
	}

	public void setShowSpecial(int showSpecial) {
		this.showSpecial = showSpecial;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public long getCartNum() {
		return cartNum;
	}

	public void setCartNum(long cartNum) {
		this.cartNum = cartNum;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public long getGift_num() {
		return gift_num;
	}

	public void setGift_num(long gift_num) {
		this.gift_num = gift_num;
	}

	public long getUserId2() {
		return userId2;
	}

	public void setUserId2(long userId2) {
		this.userId2 = userId2;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getAccepted_date() {
		return accepted_date;
	}

	public void setAccepted_date(String accepted_date) {
		this.accepted_date = accepted_date;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getQuestionCount() {
		return questionCount;
	}

	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
	}

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}

	private String message;
	private String created_date;
	private String accepted_date;
	
	private double score;
	private int reviewCount;
	private int questionCount;
	
	private List<MultipartFile> selectFile;

	
	
}
