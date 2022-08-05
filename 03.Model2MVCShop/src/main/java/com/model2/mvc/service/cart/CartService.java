package com.model2.mvc.service.cart;

import java.util.List;

import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Purchase;

public interface CartService {
	
	public void addCart(Cart cart) throws Exception;
	
	public String purchaseCart(Purchase purchase, int cartNo) throws Exception;
	
	public void deleteCart(List<Integer> cartList) throws Exception;
	
	public void deleteCart(int cartNo) throws Exception;
	
	public List<Cart> getCartList(String userId) throws Exception;
	
	public void updateCart(Cart cart) throws Exception;

}
