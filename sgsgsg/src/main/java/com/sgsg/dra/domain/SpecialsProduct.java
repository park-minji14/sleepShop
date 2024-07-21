package com.sgsg.dra.domain;

/* listProduct 쿼리의 결과를 담기 위한 것임.
SPECIALS, SPECIALSDETAIL, PRODUCT, PRODUCT_CATEGORY 테이블을 조인한 결과를 표현함.
특가/기획 상품에 포함된 개별 제품의 정보를 담고 있음 (예: 제품 번호, 카테고리, 제품명, 가격, 할인율 등).*/

public class SpecialsProduct {
    private Long productNum;
    private Long categoryNum;
    private String categoryName;
    private String productName;
    private int price;
    private int savedMoney;
    private int discountRate;
    private int delivery;
    private String thumbnail;
    private int saleCount;
    
 // 데이터베이스에 매핑되지 않는 임시 필드
    private transient int salePrice;
    
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public Long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Long categoryNum) {
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSavedMoney() {
		return savedMoney;
	}
	public void setSavedMoney(int savedMoney) {
		this.savedMoney = savedMoney;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

}
