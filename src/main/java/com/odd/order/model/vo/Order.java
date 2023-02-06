package com.odd.order.model.vo;

import java.security.Timestamp;

public class Order {

	public Order() {}
	
	private int ordNo;
	private int userNo;
	private String delAdd;
	private int payment;
	private String delivery;
	private String status;
	private String phone;
	private String Email;
	private String address;
	private String require;
	private Timestamp orderDate;
	

	
	public Order(int ordNo, int userNo, String delAdd, int payment, String delivery, String status, String phone,
			String email, String address, String require, Timestamp orderDate) {
		super();
		this.ordNo = ordNo;
		this.userNo = userNo;
		this.delAdd = delAdd;
		this.payment = payment;
		this.delivery = delivery;
		this.status = status;
		this.phone = phone;
		Email = email;
		this.address = address;
		this.require = require;
		this.orderDate = orderDate;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
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

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
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

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Order [ordNo=" + ordNo + ", userNo=" + userNo + ", delAdd=" + delAdd + ", payment=" + payment
				+ ", delivery=" + delivery + ", status=" + status + ", phone=" + phone + ", Email=" + Email
				+ ", address=" + address + ", require=" + require + ", orderDate=" + orderDate + "]";
	}

	
	
	
}


