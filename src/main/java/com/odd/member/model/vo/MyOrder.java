package com.odd.member.model.vo;

import java.sql.Date;

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
	private Date orderDate;
	
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
	
	public MyOrder(int ordNo, int userNo, String delAdd, String payment, String deliveryStatus, String phone,
			String address, String require, Date orderDate) {
		super();
		this.ordNo = ordNo;
		this.userNo = userNo;
		this.delAdd = delAdd;
		this.payment = payment;
		this.deliveryStatus = deliveryStatus;
		this.phone = phone;
		this.address = address;
		this.require = require;
		this.orderDate = orderDate;
	}

	public MyOrder(int ordNo, int proNo, int userNo, String delAdd, String payment, String deliveryStatus, String phone,
			String address, String require, Date orderDate, String thumbImg, String proName, int price, int amount,
			String userId, String userName, int totalPrice, int deliveryPrice, int discount) {
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
		this.orderDate = orderDate;
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

	@Override
	public String toString() {
		return "MyOrder [ordNo=" + ordNo + ", proNo=" + proNo + ", userNo=" + userNo + ", delAdd=" + delAdd
				+ ", payment=" + payment + ", deliveryStatus=" + deliveryStatus + ", phone=" + phone + ", address="
				+ address + ", require=" + require + ", thumbImg=" + thumbImg + ", proName=" + proName + ", price="
				+ price + ", amount=" + amount + ", userId=" + userId + ", userName=" + userName + ", totalPrice="
				+ totalPrice + ", deliveryPrice=" + deliveryPrice + ", discount=" + discount + "]";
	}

	
	

}