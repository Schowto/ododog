package com.odd.product.model.vo;

public class Order {

	public Order() {}
	
	private int ordNo;
	private int proNo;
	private int userNo;
	private String delAdd;
	private int payment;
	private String delivery;
	private String status;
	private String phone;
	private String Email;
	private String address;
	private String require;
	
	public Order(int ordNo, int proNo, int userNo, String delAdd, int payment, String delivery, String status,
			String phone, String email, String address, String require) {
		super();
		this.ordNo = ordNo;
		this.proNo = proNo;
		this.userNo = userNo;
		this.delAdd = delAdd;
		this.payment = payment;
		this.delivery = delivery;
		this.status = status;
		this.phone = phone;
		Email = email;
		this.address = address;
		this.require = require;
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

	@Override
	public String toString() {
		return "Order [ordNo=" + ordNo + ", proNo=" + proNo + ", userNo=" + userNo + ", delAdd=" + delAdd + ", payment="
				+ payment + ", delivery=" + delivery + ", status=" + status + ", phone=" + phone + ", Email=" + Email
				+ ", address=" + address + ", require=" + require + "]";
	}
	
	
	
}


