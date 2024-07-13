package com.sgsg.dra.domain;

public class ClinicAnswer {
	public long answer_num;
	public long question_id;
	public String title;
	public String content;
	public String created_date;
	public String updated_date;
	public String image;
	
	public String userId;
	public String userName;
	public int membership;
	
	public int pickup;  // 채택 여부
	public String rated_date;
	public String content2;
	
	public int answerCount;
	
	
	
	
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
	

}
