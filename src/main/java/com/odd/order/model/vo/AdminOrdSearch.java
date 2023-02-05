package com.odd.order.model.vo;

public class AdminOrdSearch {
	private String proName;
	private String userName;
	private String lowPrice;
	private String highPrice;
	
	public AdminOrdSearch() {}

	public AdminOrdSearch(String proName, String userName, String lowPrice, String highPrice) {
		super();
		this.proName = proName;
		this.userName = userName;
		this.lowPrice = lowPrice;
		this.highPrice = highPrice;
	}
	
	
	public AdminOrdSearch(String userName, String lowPrice, String highPrice) {
		super();
		this.userName = userName;
		this.lowPrice = lowPrice;
		this.highPrice = highPrice;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	@Override
	public String toString() {
		return "AdminOrdSearch [proName=" + proName + ", userName=" + userName + ", lowPrice=" + lowPrice
				+ ", highPrice=" + highPrice + "]";
	};
	
	
	
	
	
	
	

}
