package com.odd.member.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private int proNo;
	private int userNo;
	private String reviewTitle;
	private String reviewContent;
	private double star;
	private Date modifyDate;
	private Date enrollDate;
	private String reviewPhoto;
	private String filePath;
	
	public Review() {
		
	}
	
	public Review(int reviewNo, int proNo, int userNo, String reviewTitle, String reviewContent, double star,
			Date modifyDate, Date enrollDate, String reviewPhoto, String filePath) {
		super();
		this.reviewNo = reviewNo;
		this.proNo = proNo;
		this.userNo = userNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.star = star;
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
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
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
		return "Review [reviewNo=" + reviewNo + ", proNo=" + proNo + ", userNo=" + userNo + ", reviewTitle="
				+ reviewTitle + ", reviewContent=" + reviewContent + ", star=" + star + ", modifyDate=" + modifyDate
				+ ", enrollDate=" + enrollDate + ", reviewPhoto=" + reviewPhoto + ", filePath=" + filePath + "]";
	}
	
	
	
	
	
	
	
	

}
