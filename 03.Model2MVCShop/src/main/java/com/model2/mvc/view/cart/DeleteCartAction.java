package com.model2.mvc.view.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.cart.CartService;

@Controller("deleteCartAction")
public class DeleteCartAction extends Action {
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService service;

	public void setService(CartService service) {
		this.service = service;
	}

	public DeleteCartAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String[] cartBoxArr = request.getParameterValues("cartBox");
		if(cartBoxArr==null) {
			return "forward:/listCart.do";
		}
		int arrLength = cartBoxArr.length;
		
		for(int i=0;i<arrLength;i++) {
			int cartNo = Integer.parseInt(request.getParameter(cartBoxArr[i]+"cartNo"));
			if(request.getParameter("flag").equals("check")) {
				int amount = Integer.parseInt(request.getParameter(cartBoxArr[i]+"amount"));
				if(amount==0) {
					service.deleteCart(cartNo);
				}
			}else {
				service.deleteCart(cartNo);
			}
		}
		
		return "forward:/listCart.do";
	}
}
