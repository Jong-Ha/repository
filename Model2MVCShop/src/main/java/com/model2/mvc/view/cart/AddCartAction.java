package com.model2.mvc.view.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.cart.CartService;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

public class AddCartAction extends Action {
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService service;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public void setService(CartService service) {
		this.service = service;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public AddCartAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		int prodNo = Integer.parseInt(request.getParameter("prod_no"));

		Cart cart = new Cart();
		Product product = new Product();
		
		product.setProdNo(prodNo);
		cart.setProd(product);
		cart.setAmount(Integer.parseInt(request.getParameter("amount")));
		
		User user = (User)session.getAttribute("user");
		if(user!=null) {
			cart.setUserId(user.getUserId());
			service.addCart(cart);
			request.setAttribute("cart", cart);
		}else {
			List<Cart> list = (List<Cart>)session.getAttribute("list");
			if(list==null) {
				list = new ArrayList<Cart>();
			}
			product = productService.getProduct(prodNo);
			cart.setCartNo(list.size()+1);
			cart.setProd(product);
			list.add(cart);
			session.setAttribute("list", list);
		}
		
		return "forward:/cart/addCart.jsp";
	}

}
