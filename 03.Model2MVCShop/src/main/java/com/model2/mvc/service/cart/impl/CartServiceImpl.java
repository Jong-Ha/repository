package com.model2.mvc.service.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.cart.CartDao;
import com.model2.mvc.service.cart.CartService;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.purchase.PurchaseDao;

@Service("cartServiceImpl")
public class CartServiceImpl implements CartService {

	/// Field
	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDao cartDao;

	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

	public CartServiceImpl() {
	}

	@Override
	public void addCart(Cart cart) throws Exception {
		Integer cartNo = cartDao.checkCart(cart);
		
		if(cartNo==null) {
			cartDao.addCart(cart);
		}else {
			cart.setCartNo(cartNo);
			cartDao.updateCart(cart);
		}
	}

	@Override
	public String purchaseCart(Purchase purchase, int cartNo) throws Exception {
		int prodAmount = cartDao.checkProduct(purchase.getPurchaseProd().getProdNo());
		if(prodAmount < purchase.getAmount()) {
			return "fail";
		}else if(prodAmount==0){
			cartDao.deleteCart(cartNo);
			return "soldOut";
		}else {
			productDao.updateProductAmount(purchase);
			purchaseDao.addPurchase(purchase);
			cartDao.deleteCart(cartNo);
			return "success";
		}
	}

	@Override
	public void deleteCart(List<Integer> cartList) throws Exception {
		cartDao.deleteCart(cartList);
	}

	@Override
	public void deleteCart(int cartNo) throws Exception {
		cartDao.deleteCart(cartNo);
	}

	@Override
	public List<Cart> getCartList(String userId) throws Exception {
		return cartDao.getCartList(userId);
	}

	@Override
	public void updateCart(Cart cart) throws Exception {
		cartDao.updateCart(cart);
	}

}
