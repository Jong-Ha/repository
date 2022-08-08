package com.model2.mvc.service.domain;

public class Cart {
	
	///Field
	private int cartNo;
	private String userId;
	private Product prod;
	private int amount;

	///Constructor
	public Cart() {
	}


	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Product getProd() {
		return prod;
	}
	public void setProd(Product prod) {
		this.prod = prod;
	}
	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", userId=" + userId + ", prod=" + prod + ", amount=" + amount + "]";
	}
}
