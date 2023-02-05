package com.odd.order.model.vo;

public class OrdPro {

	private int ordProNo;
	private int ordNo;
	private int proNo;
	private int amount;
	
	private String proName;
	private int price;
	private String thumbImg;
	private String category;
	private double save;
	
	
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getSave() {
		return save;
	}

	public void setSave(double save) {
		this.save = save;
	}

	@Override
	public String toString() {
		return "OrdPro [ordProNo=" + ordProNo + ", ordNo=" + ordNo + ", proNo=" + proNo + ", amount=" + amount + "]";
	};
	
	
	
	
	
	
	
}
