package com.odd.board.model.vo;

import java.sql.Date;

public class Consult {
	
	private int consultNo;
	private int userNo;
	private String consultTitle;
	private String consultContent;
	private Date enrollDate;
	private Date modifyDate;
	private String consultAnswer;
	private Date answerDate;
	private String status;
	private String originName;
	private String filePath;
	private String consultCategory;
	private int respondents;
	
	
	public Consult() {}
	
	
	
	public Consult(int consultNo, int userNo, String consultTitle, String consultContent, Date enrollDate,
			Date modifyDate, String consultAnswer, Date answerDate, String status, String originName, String filePath,
			String consultCategory, int respondents) {
		super();
		this.consultNo = consultNo;
		this.userNo = userNo;
		this.consultTitle = consultTitle;
		this.consultContent = consultContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.consultAnswer = consultAnswer;
		this.answerDate = answerDate;
		this.status = status;
		this.originName = originName;
		this.filePath = filePath;
		this.consultCategory = consultCategory;
		this.respondents = respondents;
	}
	
	
	
	public int getConsultNo() {
		return consultNo;
	}
	public void setConsultNo(int consultNo) {
		this.consultNo = consultNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getConsultTitle() {
		return consultTitle;
	}
	public void setConsultTitle(String consultTitle) {
		this.consultTitle = consultTitle;
	}
	public String getConsultContent() {
		return consultContent;
	}
	public void setConsultContent(String consultContent) {
		this.consultContent = consultContent;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getConsultAnswer() {
		return consultAnswer;
	}
	public void setConsultAnswer(String consultAnswer) {
		this.consultAnswer = consultAnswer;
	}
	public Date getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getConsultCategory() {
		return consultCategory;
	}
	public void setConsultCategory(String consultCategory) {
		this.consultCategory = consultCategory;
	}
	public int getRespondents() {
		return respondents;
	}
	public void setRespondents(int respondents) {
		this.respondents = respondents;
	}
	
	
	
	@Override
	public String toString() {
		return "Consult [consultNo=" + consultNo + ", userNo=" + userNo + ", consultTitle=" + consultTitle
				+ ", consultContent=" + consultContent + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", consultAnswer=" + consultAnswer + ", answerDate=" + answerDate + ", status=" + status
				+ ", originName=" + originName + ", filePath=" + filePath + ", consultCategory=" + consultCategory
				+ ", respondents=" + respondents + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
