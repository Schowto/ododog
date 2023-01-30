package com.odd.product.model.vo;

public class ProductDetail {

	private String proName;
	private int price;
	private String thumbImg;
		

	public ProductDetail() {}


	public ProductDetail(String proName, int price, String thumbImg) {
		super();
		this.proName = proName;
		this.price = price;
		this.thumbImg = thumbImg;
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


	@Override
	public String toString() {
		return "ProductDetail [proName=" + proName + ", price=" + price + ", thumbImg=" + thumbImg + "]";
	}
	
	
	

	
}
