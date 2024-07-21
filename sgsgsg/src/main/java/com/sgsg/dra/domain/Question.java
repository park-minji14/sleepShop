package com.sgsg.dra.domain;

import java.util.List;


import org.springframework.web.multipart.MultipartFile;

public class Question {
    private int inquiryNum; // 질문번호
    private int productNum; 
    private int secret; 
    private String question; 
    private String answer; 
    private int showQuestion;
    private int locked; 
    
    private String question_Date; 
    private String answer_Date; 
    private String userId; 
    private String answerId; 
    private String inquiryType; 
    
    private long fileNum;
    private String filename;
    private List<MultipartFile> selectFile;
    private String[] listFilename;
    private String productName;
	private long memberIdx;
	private String userName;
	
	private String answerStatus; // 답변 상태 (답변대기, 답변완료)
    
    public long getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public String[] getListFilename() {
		return listFilename;
	}
	public void setListFilename(String[] listFilename) {
		this.listFilename = listFilename;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getInquiryNum() {
		return inquiryNum;
	}
	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getQuestion() {	 
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getShowQuestion() {
		return showQuestion;
	}
	public void setShowQuestion(int showQuestion) {
		this.showQuestion = showQuestion;
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
	public String getAnswerId() {
		return answerId;
	}
	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}
	public String getInquiryType() {
		return inquiryType;
	}
	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	public String getQuestion_Date() {
		return question_Date;
	}

	public void setQuestion_Date(String question_Date) {
		this.question_Date = question_Date;
	}

	public String getAnswer_Date() {
		return answer_Date;
	}

	public void setAnswer_Date(String answer_Date) {
		this.answer_Date = answer_Date;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}
}
