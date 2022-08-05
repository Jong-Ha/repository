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
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Product;

@Controller("buyCartViewAction")
public class BuyCartViewAction extends Action {
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService service;

	public void setService(CartService service) {
		this.service = service;
	}

	public BuyCartViewAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String[] cartBoxArr = request.getParameterValues("cartBox");
		if(cartBoxArr==null) {
			return "forward:/listCart.do";
		}
		int arrLength = cartBoxArr.length;
		
		List<Cart> list = new ArrayList<Cart>();
		
		for(int i=0;i<arrLength;i++) {
			Cart cart = new Cart();
			Product prod = new Product();
			prod.setProdNo(Integer.parseInt(request.getParameter(cartBoxArr[i]+"prodNo")));
			cart.setCartNo(Integer.parseInt(request.getParameter(cartBoxArr[i]+"cartNo")));
			cart.setAmount(Integer.parseInt(request.getParameter(cartBoxArr[i]+"amount")));
			cart.setProd(prod);
			service.updateCart(cart);
			list.add(cart);
		}
		
		request.setAttribute("list", list);
		
		System.out.println(list);
		
		return "forward:/cart/buyCartView.jsp";
	}

}
