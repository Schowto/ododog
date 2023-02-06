package com.odd.product.model.vo;

import java.sql.Timestamp;

public class Payment {

	int paymentNo;
	int ordNo;
	int discount;
	int delivery;
	int totalPrice;
	Timestamp payDate;
	String card;
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Payment(int paymentNo, int ordNo, int discount, int delivery, int totalPrice, Timestamp payDate,
			String card) {
		super();
		this.paymentNo = paymentNo;
		this.ordNo = ordNo;
		this.discount = discount;
		this.delivery = delivery;
		this.totalPrice = totalPrice;
		this.payDate = payDate;
		this.card = card;
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public int getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Timestamp getPayDate() {
		return payDate;
	}
	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", ordNo=" + ordNo + ", discount=" + discount + ", delivery="
				+ delivery + ", totalPrice=" + totalPrice + ", payDate=" + payDate + ", card=" + card + "]";
	}


}
