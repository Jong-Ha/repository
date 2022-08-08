package com.model2.mvc.view.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.cart.CartService;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;

public class BuyCartAction extends Action {
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService service;

	public void setService(CartService service) {
		this.service = service;
	}

	public BuyCartAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String[] cartNoArr = request.getParameterValues("cartNo");
		String[] amountArr = request.getParameterValues("amount");
		String[] prodNoArr = request.getParameterValues("prodNo");
		
		int arrLength = cartNoArr.length;
		
		Purchase purchase = new Purchase();
		User user = new User();
		user.setUserId(request.getParameter("userId"));
		purchase.setBuyer(user);
		Product product = new Product();
		
		purchase.setPaymentOption(request.getParameter("paymentOption"));
		purchase.setReceiverName(request.getParameter("receiverName"));
		purchase.setReceiverPhone(request.getParameter("receiverPhone"));
		purchase.setDivyAddr(request.getParameter("receiverAddr"));
		purchase.setDivyRequest(request.getParameter("receiverRequest"));
		purchase.setDivyDate(request.getParameter("receiverDate"));

		List<Integer> successies = new ArrayList<Integer>();
		List<Integer> failes = new ArrayList<Integer>();
		List<Integer> soldOut = new ArrayList<Integer>();
		
		for(int i=0;i<arrLength;i++) {
			int cartNo = Integer.parseInt(cartNoArr[i]);
			
			product.setProdNo(Integer.parseInt(prodNoArr[i]));
			purchase.setPurchaseProd(product);
			purchase.setAmount(Integer.parseInt(amountArr[i]));
			String result = service.purchaseCart(purchase,cartNo);
			if(result.equals("success")) {
				successies.add(cartNo);
			}else if(result.equals("soldOut")) {
				soldOut.add(cartNo);
			}else {
				failes.add(cartNo);
			}
		}
		
		request.setAttribute("success", successies);
		request.setAttribute("fail", failes);
		request.setAttribute("soldOut", soldOut);
		
		return "forward:/cart/buyCart.jsp";
	}

}
