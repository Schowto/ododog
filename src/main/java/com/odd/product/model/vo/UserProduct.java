package com.odd.product.model.vo;

/**
 * @author user
 *
 */
public class UserProduct {

	private int proNo;
	private String category;
	private String proName;
	private int price;
	private String soldout;
	private String expiredDate;
	private String enrollDate;
	private double save;
	private String status;
	private String thumbImg;	

	public UserProduct() {}

	public UserProduct(int proNo, String category, String proName, int price, String soldout, String expiredDate,
			String enrollDate, double save, String status, String thumbImg) {
		super();
		this.proNo = proNo;
		this.category = category;
		this.proName = proName;
		this.price = price;
		this.soldout = soldout;
		this.expiredDate = expiredDate;
		this.enrollDate = enrollDate;
		this.save = save;
		this.status = status;
		this.thumbImg = thumbImg;
	}

	public UserProduct(int proNo, String proName, int price) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.price = price;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getSoldout() {
		return soldout;
	}

	public void setSoldout(String soldout) {
		this.soldout = soldout;
	}

	public String getExpiredDate() {
		return expiredDate;
	}

	public void setExpiredDate(String expiredDate) {
		this.expiredDate = expiredDate;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public double getSave() {
		return save;
	}

	public void setSave(double save) {
		this.save = save;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}

	@Override
	public String toString() {
		return "UserProduct [proNo=" + proNo + ", category=" + category + ", proName=" + proName + ", price=" + price
				+ ", soldout=" + soldout + ", expiredDate=" + expiredDate + ", enrollDate=" + enrollDate + ", save="
				+ save + ", status=" + status + ", thumbImg=" + thumbImg + "]";
	}

	public UserProduct(String proName, int price) {
		super();
		this.proName = proName;
		this.price = price;
	}

	public UserProduct(String proName, int price, String thumbImg) {
		super();
		this.proName = proName;
		this.price = price;
		this.thumbImg = thumbImg;
	}

	public UserProduct(int proNo, String proName, int price, String thumbImg) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.price = price;
		this.thumbImg = thumbImg;
	}
	
	


	


	

	
}
