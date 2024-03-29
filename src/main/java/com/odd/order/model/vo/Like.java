package com.odd.order.model.vo;

import java.sql.Date;

public class Like {
	
	private int pro_no;
	private int user_no;
	private Date like_date;
	
	private String proName;
	private int price;
	private String thumbImg;
	
	public Like() {}

	public Like(int pro_no, int user_no, Date like_date) {
		super();
		this.pro_no = pro_no;
		this.user_no = user_no;
		this.like_date = like_date;
	}

	public Like(int pro_no, int user_no, Date like_date, String proName, int price, String thumbImg) {
		super();
		this.pro_no = pro_no;
		this.user_no = user_no;
		this.like_date = like_date;
		this.proName = proName;
		this.price = price;
		this.thumbImg = thumbImg;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public Date getLike_date() {
		return like_date;
	}

	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}

	@Override
	public String toString() {
		return "Like [pro_no=" + pro_no + ", user_no=" + user_no + ", like_date=" + like_date + ", proName=" + proName
				+ ", price=" + price + ", thumbImg=" + thumbImg + "]";
	}

	
	
	
	

}
