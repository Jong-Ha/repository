package com.model2.mvc.view.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.common.abs.ListAction;
import com.model2.mvc.service.cart.CartService;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.User;

public class ListCartAction extends ListAction {
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService service;

	public void setService(CartService service) {
		this.service = service;
	}

	public ListCartAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListCartAction start");
		
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		List<Cart> list = (List<Cart>)session.getAttribute("list");
		int totalPrice = 0;
		
		if(user!=null) {
			if(list!=null) {
				for(Cart cart : list) {
					cart.setUserId(user.getUserId());
					service.addCart(cart);
				}
				session.removeAttribute("list");
			}
			String userId = user.getUserId();
			list = service.getCartList(userId);
		}
		if(list!=null) {
			for(Cart cart : list) {
				if(cart.getAmount()>cart.getProd().getAmount()) {
					cart.setAmount(cart.getProd().getAmount());
				}
				totalPrice += cart.getAmount()*cart.getProd().getPrice();
			}
		}

		request.setAttribute("list", list);
		request.setAttribute("totalPrice", totalPrice);
		
		System.out.println("ListCartAction end");
		return "forward:/cart/listCart.jsp";
	}

}
