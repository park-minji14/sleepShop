package com.sgsg.dra.domain;

//이 클래스는 SPECIALS 테이블의 구조를 반영함.
//특가/기획 상품의 기본 정보를 담고 있음 (예: 특가 번호, 제목, 내용, 이미지, 시작일, 종료일 등).
//dataCountSpecials, listSpecials, findById 쿼리의 결과를 담는데 사용됨.

public class Specials {
    private Long specialNum;
    private String subject;
    private String content;
    private String imageFilename;
    private String startDate; 
    private String endDate;    
    private int showSpecial;
    private String regDate;
    
	public Long getSpecialNum() {
		return specialNum;
	}
	public void setSpecialNum(Long specialNum) {
		this.specialNum = specialNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
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
	public int getShowSpecial() {
		return showSpecial;
	}
	public void setShowSpecial(int showSpecial) {
		this.showSpecial = showSpecial;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}  
    

}
