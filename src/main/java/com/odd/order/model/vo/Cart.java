package com.odd.order.model.vo;

import com.odd.member.model.vo.Member;
import com.odd.product.model.vo.Product;

public class Cart {

	private int cartNo;
	
	private Member member;
	
	private Product product;
	
	private int cartQty;

	
	public Cart() {
		super();
	}


	public Cart(int cartNo, Member member, Product product, int cartQty) {
		super();
		this.cartNo = cartNo;
		this.member = member;
		this.product = product;
		this.cartQty = cartQty;
	}

	public int getCartNo() {
		return cartNo;
	}


	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}


	public Member getMember() {
		return member;
	}


	public void setMember(Member member) {
		this.member = member;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public int getCartQty() {
		return cartQty;
	}


	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}


	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", member=" + member + ", product=" + product + ", cartQty=" + cartQty + "]";
	}


	
	
}

