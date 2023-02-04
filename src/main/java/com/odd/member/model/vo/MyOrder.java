package com.odd.member.model.vo;

public class MyOrder {
	
	// TB_ORDER
	private int ordNo;
	private int proNo;
	private int userNo;
	private String delAdd;
	private String payment;
	private String deliveryStatus;
	private String phone;
	private String address;
	private String require;
	
	// PRODUCT
	private String thumbImg;
	private String proName;
	private int price;
	
	
	// ORD_PRO
	private int amount;
	
	// MEMBER
	private String userId;
	private String userName;
	
	
	// PAYMENT
	private int totalPrice;
	private int deliveryPrice;
	private int discount;
	
	public MyOrder() {}

	public MyOrder(int ordNo, int proNo, int userNo, String delAdd, String payment, String deliveryStatus, String phone,
			String address, String require, String thumbImg, String proName, int price, int amount, String userId,
			String userName, int totalPrice, int deliveryPrice, int discount) {
		super();
		this.ordNo = ordNo;
		this.proNo = proNo;
		this.userNo = userNo;
		this.delAdd = delAdd;
		this.payment = payment;
		this.deliveryStatus = deliveryStatus;
		this.phone = phone;
		this.address = address;
		this.require = require;
		this.thumbImg = thumbImg;
		this.proName = proName;
		this.price = price;
		this.amount = amount;
		this.userId = userId;
		this.userName = userName;
		this.totalPrice = totalPrice;
		this.deliveryPrice = deliveryPrice;
		this.discount = discount;
	}
	
	

	public MyOrder(int ordNo, int proNo, int userNo, String delAdd, String payment, String deliveryStatus, String phone,
			String address, String require, String thumbImg, String proName, int price, int amount) {
		super();
		this.ordNo = ordNo;
		this.proNo = proNo;
		this.userNo = userNo;
		this.delAdd = delAdd;
		this.payment = payment;
		this.deliveryStatus = deliveryStatus;
		this.phone = phone;
		this.address = address;
		this.require = require;
		this.thumbImg = thumbImg;
		this.proName = proName;
		this.price = price;
		this.amount = amount;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
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

	public String getDelAdd() {
		return delAdd;
	}

	public void setDelAdd(String delAdd) {
		this.delAdd = delAdd;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRequire() {
		return require;
	}

	public void setRequire(String require) {
		this.require = require;
	}

	public String getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getDeliveryPrice() {
		return deliveryPrice;
	}

	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "MyOrder [ordNo=" + ordNo + ", proNo=" + proNo + ", userNo=" + userNo + ", delAdd=" + delAdd
				+ ", payment=" + payment + ", deliveryStatus=" + deliveryStatus + ", phone=" + phone + ", address="
				+ address + ", require=" + require + ", thumbImg=" + thumbImg + ", proName=" + proName + ", price="
				+ price + ", amount=" + amount + ", userId=" + userId + ", userName=" + userName + ", totalPrice="
				+ totalPrice + ", deliveryPrice=" + deliveryPrice + ", discount=" + discount + "]";
	}
	
	

}