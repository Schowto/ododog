package com.odd.order.model.vo;

public class OrdPro {

	private int ordProNo;
	private int ordNo;
	private int proNo;
	private int amount;
	
	public OrdPro() {}

	public OrdPro(int ordProNo, int ordNo, int proNo, int amount) {
		super();
		this.ordProNo = ordProNo;
		this.ordNo = ordNo;
		this.proNo = proNo;
		this.amount = amount;
	}

	public int getOrdProNo() {
		return ordProNo;
	}

	public void setOrdProNo(int ordProNo) {
		this.ordProNo = ordProNo;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "OrdPro [ordProNo=" + ordProNo + ", ordNo=" + ordNo + ", proNo=" + proNo + ", amount=" + amount + "]";
	};
	
	
	
	
	
	
	
}
