package com.odd.product.model.vo;

public class AdminProSearch {
	
	private String proName;
	private String category;
	private String soldout;
	private String expDateRemain;
	private String lowPrice;
	private String highPrice;
	private String firstDate;
	private String secondDate;
	
	public AdminProSearch() {}

	public AdminProSearch(String proName, String category, String soldout, String expDateRemain, String lowPrice,
			String highPrice, String firstDate, String secondDate) {
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

	public String getLowPrice() {
		return lowPrice;
	}

	public void setLowPrice(String lowPrice) {
		this.lowPrice = lowPrice;
	}

	public String getHighPrice() {
		return highPrice;
	}

	public void setHighPrice(String highPrice) {
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
