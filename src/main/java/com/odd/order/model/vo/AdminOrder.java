package com.odd.order.model.vo;

public class AdminOrder {
	
	private int ordNo;
	
	private int proNo;
	private String proName;
	private int amount;
	
	private int userNo;
	private String userName;
	private String delAdd;
	private String phone;
	private String email;
	private String address;
	
	private int discount;
	private int totalPrice;
	private double save;
	
	private String payment;
	private String delivery;
	
	private String require;
	private String orderDate;
	
	public AdminOrder() {}
	
	

	public AdminOrder(int ordNo, int proNo, String proName, int amount, int userNo, String userName, String delAdd,
			String phone, String email, String address, int discount, int totalPrice, double save, String payment,
			String delivery, String require, String orderDate) {
		super();
		this.ordNo = ordNo;
		this.proNo = proNo;
		this.proName = proName;
		this.amount = amount;
		this.userNo = userNo;
		this.userName = userName;
		this.delAdd = delAdd;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.discount = discount;
		this.totalPrice = totalPrice;
		this.save = save;
		this.payment = payment;
		this.delivery = delivery;
		this.require = require;
		this.orderDate = orderDate;
	}



	public AdminOrder(int ordNo, int proNo, String proName, int amount, int userNo, String userName, String delAdd,
			String phone, String email, String address, int discount, int totalPrice, double save, String payment,
			String delivery, String require) {
		super();
		this.ordNo = ordNo;
		this.proNo = proNo;
		this.proName = proName;
		this.amount = amount;
		this.userNo = userNo;
		this.userName = userName;
		this.delAdd = delAdd;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.discount = discount;
		this.totalPrice = totalPrice;
		this.save = save;
		this.payment = payment;
		this.delivery = delivery;
		this.require = require;
	}

	
	
	public AdminOrder(int ordNo, String proName, int amount, String userName, String delAdd, String phone, String email,
			int totalPrice, String payment, String delivery, String require) {
		super();
		this.ordNo = ordNo;
		this.proName = proName;
		this.amount = amount;
		this.userName = userName;
		this.delAdd = delAdd;
		this.phone = phone;
		this.email = email;
		this.totalPrice = totalPrice;
		this.payment = payment;
		this.delivery = delivery;
		this.require = require;
	}
	
	
	
	public AdminOrder(int ordNo, String proName, int amount, int userNo, String userName, String delAdd, String phone,
			String email, int discount, int totalPrice, double save, String delivery, String require) {
		super();
		this.ordNo = ordNo;
		this.proName = proName;
		this.amount = amount;
		this.userNo = userNo;
		this.userName = userName;
		this.delAdd = delAdd;
		this.phone = phone;
		this.email = email;
		this.discount = discount;
		this.totalPrice = totalPrice;
		this.save = save;
		this.require = require;
	}
	
	

	public AdminOrder(int ordNo, String userName, String delAdd, String phone, String email, int totalPrice,
			String payment, String delivery, String require) {
		super();
		this.ordNo = ordNo;
		this.userName = userName;
		this.delAdd = delAdd;
		this.phone = phone;
		this.email = email;
		this.totalPrice = totalPrice;
		this.payment = payment;
		this.delivery = delivery;
		this.require = require;
	}
	
	

	public AdminOrder(int ordNo, int userNo, String userName, String delAdd, String phone, String email, int discount,
			int totalPrice, String delivery, String require) {
		super();
		this.ordNo = ordNo;
		this.userNo = userNo;
		this.userName = userName;
		this.delAdd = delAdd;
		this.phone = phone;
		this.email = email;
		this.discount = discount;
		this.totalPrice = totalPrice;
		this.delivery = delivery;
		this.require = require;
	}

	
	
	public String getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public double getSave() {
		return save;
	}

	public void setSave(double save) {
		this.save = save;
	}

	@Override
	public String toString() {
		return "AdminOrder [ordNo=" + ordNo + ", proNo=" + proNo + ", proName=" + proName + ", amount=" + amount
				+ ", userNo=" + userNo + ", userName=" + userName + ", delAdd=" + delAdd + ", payment=" + payment
				+ ", delivery=" + delivery + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", require=" + require + ", discount=" + discount + ", totalPrice=" + totalPrice + ", save=" + save
				+ "]";
	}
	

}
