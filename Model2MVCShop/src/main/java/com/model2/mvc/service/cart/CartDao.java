package com.model2.mvc.service.cart;

import java.util.List;

import com.model2.mvc.service.domain.Cart;

public interface CartDao {
	
	public Integer checkCart(Cart cart) throws Exception ;
	
	public Integer checkProduct(int prodNo) throws Exception ;
	
	public void addCart(Cart cart) throws Exception ;
	
	public void updateCart(Cart cart) throws Exception ;
	
	public void deleteCart(int cartNo) throws Exception ;
	
	public void deleteCart(List<Integer> list) throws Exception ;

	public List<Cart> getCartList(String userId) throws Exception ;

}
