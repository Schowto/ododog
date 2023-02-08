package com.odd.member.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private int proNo;
	private int userNo;
	private String proName;
	private String userId;
	private String reviewTitle;
	private String reviewContent;
	private Date modifyDate;
	private Date enrollDate;
	private String reviewPhoto;
	private String filePath;
	
	public Review() {
		
	}

	
	public Review(int reviewNo, String proName, String userId, String reviewTitle, String reviewContent,
			Date modifyDate, Date enrollDate, String reviewPhoto, String filePath) {
		super();
		this.reviewNo = reviewNo;
		this.proName = proName;
		this.userId = userId;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.modifyDate = modifyDate;
		this.enrollDate = enrollDate;
		this.reviewPhoto = reviewPhoto;
		this.filePath = filePath;
	}


	public Review(int reviewNo, int proNo, int userNo, String proName, String userId, String reviewTitle,
			String reviewContent, Date modifyDate, Date enrollDate, String reviewPhoto, String filePath) {
		super();
		this.reviewNo = reviewNo;
		this.proNo = proNo;
		this.userNo = userNo;
		this.proName = proName;
		this.userId = userId;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.modifyDate = modifyDate;
		this.enrollDate = enrollDate;
		this.reviewPhoto = reviewPhoto;
		this.filePath = filePath;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getReviewPhoto() {
		return reviewPhoto;
	}

	public void setReviewPhoto(String reviewPhoto) {
		this.reviewPhoto = reviewPhoto;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", proNo=" + proNo + ", userNo=" + userNo + ", proName=" + proName
				+ ", userId=" + userId + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent 
				+ ", modifyDate=" + modifyDate + ", enrollDate=" + enrollDate + ", reviewPhoto=" + reviewPhoto
				+ ", filePath=" + filePath + "]";
	}

	

	
	
	
	
	

}
