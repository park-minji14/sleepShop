package com.sgsg.dra.domain;

public class ClinicAnswer {
	private long answer_num;
	private long question_id;
	private String title;
	private String content;
	private String created_date;
	private String updated_date;
	private String image;
	
	private String userId;
	private String userName;
	private int membership;
	
	private int pickup;  // 채택 여부
	private String rated_date;
	private String content2;
	
	private int answerCount;
	
	private String question_userId;
	
	

	public long getAnswer_num() {
		return answer_num;
	}

	public void setAnswer_num(long answer_num) {
		this.answer_num = answer_num;
	}

	public long getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(long question_id) {
		this.question_id = question_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getUpdated_date() {
		return updated_date;
	}

	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getMembership() {
		return membership;
	}

	public void setMembership(int membership) {
		this.membership = membership;
	}

	public int getPickup() {
		return pickup;
	}

	public void setPickup(int pickup) {
		this.pickup = pickup;
	}

	public String getRated_date() {
		return rated_date;
	}

	public void setRated_date(String rated_date) {
		this.rated_date = rated_date;
	}

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public int getAnswerCount() {
		return answerCount;
	}

	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}

	public String getQuestion_userId() {
		return question_userId;
	}

	public void setQuestion_userId(String question_userId) {
		this.question_userId = question_userId;
	}
	
	
	
	
	
	
	

}
