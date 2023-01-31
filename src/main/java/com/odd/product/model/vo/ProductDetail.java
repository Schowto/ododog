package com.odd.product.model.vo;

public class ProductDetail {

	private String proName;
	private int price;
	
		

	public ProductDetail() {}


	public ProductDetail(String proName, int price) {
		super();
		this.proName = proName;
		this.price = price;
		
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




	@Override
	public String toString() {
		return "ProductDetail [proName=" + proName + ", price=" + price + "]";
	}
	
	
	

	
}
