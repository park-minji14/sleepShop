package com.sgsg.dra.domain;

public class Faq {
	private Long faq_Num;
	private String question;
	private String answer;
	private String created_Date;
	private String updated_Date;
	private int is_Active;
	private String category;
	private String userId;
	
	public Long getFaq_Num() {
		return faq_Num;
	}
	public void setFaq_Num(Long faq_Num) {
		this.faq_Num = faq_Num;
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
	public String getCreated_Date() {
		return created_Date;
	}
	public void setCreated_Date(String created_Date) {
		this.created_Date = created_Date;
	}
	public String getUpdated_Date() {
		return updated_Date;
	}
	public void setUpdated_Date(String updated_Date) {
		this.updated_Date = updated_Date;
	}
	public int getIs_Active() {
		return is_Active;
	}
	public void setIs_Active(int is_Active) {
		this.is_Active = is_Active;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
