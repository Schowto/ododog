package com.odd.point.model.vo;

import java.sql.Date;

public class Point {

	 private int pointNo;
	 private String pointCategory;
	 private Date pointDate;
	 private String pointUse;
	 private int pointPrice;
	 private int userNo;
	 private int ordNo;
	 
	 public Point() {}
	 
	 

	public Point(int userNo, Date pointDate, String pointUse, int pointPrice) {
		super();
		this.userNo = userNo;
		this.pointDate = pointDate;
		this.pointUse = pointUse;
		this.pointPrice = pointPrice;
	}



	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public String getPointCategory() {
		return pointCategory;
	}

	public void setPointCategory(String pointCategory) {
		this.pointCategory = pointCategory;
	}

	public Date getPointDate() {
		return pointDate;
	}

	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}

	public String getPointUse() {
		return pointUse;
	}

	public void setPointUse(String pointUse) {
		this.pointUse = pointUse;
	}

	public int getPointPrice() {
		return pointPrice;
	}

	public void setPointPrice(int pointPrice) {
		this.pointPrice = pointPrice;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}

	public Point(int pointNo, String pointCategory, Date pointDate, String pointUse, int pointPrice, int userNo,
			int ordNo) {
		super();
		this.pointNo = pointNo;
		this.pointCategory = pointCategory;
		this.pointDate = pointDate;
		this.pointUse = pointUse;
		this.pointPrice = pointPrice;
		this.userNo = userNo;
		this.ordNo = ordNo;
	}

	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", pointCategory=" + pointCategory + ", pointDate=" + pointDate
				+ ", pointUse=" + pointUse + ", pointPrice=" + pointPrice + ", userNo=" + userNo + ", ordNo=" + ordNo
				+ "]";
	}
	 
	 
}
