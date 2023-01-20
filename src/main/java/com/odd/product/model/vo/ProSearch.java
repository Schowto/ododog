package com.odd.product.model.vo;

public class ProSearch {
	
	private String proName;
	private String category;
	private String soldout;
	private String expDateRemain;
	private int lowPrice;
	private int highPrice;
	private String firstDate;
	private String secondDate;
	
	public ProSearch() {}

	public ProSearch(String proName, String category, String soldout, String expDateRemain, int lowPrice, int highPrice,
			String firstDate, String secondDate) {
		super();
		this.proName = proName;
		this.category = category;
		this.soldout = soldout;
		this.expDateRemain = expDateRemain;
		this.lowPrice = lowPrice;
		this.highPrice = highPrice;
		this.firstDate = firstDate;
		this.secondDate = secondDate;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSoldout() {
		return soldout;
	}

	public void setSoldout(String soldout) {
		this.soldout = soldout;
	}

	public String getExpDateRemain() {
		return expDateRemain;
	}

	public void setExpDateRemain(String expDateRemain) {
		this.expDateRemain = expDateRemain;
	}

	public int getLowPrice() {
		return lowPrice;
	}

	public void setLowPrice(int lowPrice) {
		this.lowPrice = lowPrice;
	}

	public int getHighPrice() {
		return highPrice;
	}

	public void setHighPrice(int highPrice) {
		this.highPrice = highPrice;
	}

	public String getFirstDate() {
		return firstDate;
	}

	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}

	public String getSecondDate() {
		return secondDate;
	}

	public void setSecondDate(String secondDate) {
		this.secondDate = secondDate;
	}

	@Override
	public String toString() {
		return "ProSearch [proName=" + proName + ", category=" + category + ", soldout=" + soldout + ", expDateRemain="
				+ expDateRemain + ", lowPrice=" + lowPrice + ", highPrice=" + highPrice + ", firstDate=" + firstDate
				+ ", secondDate=" + secondDate + "]";
	}
	
	
	
}
