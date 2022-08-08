package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

public class AddPurchaseViewAction extends Action {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService prodService;

	public void setProdService(ProductService prodService) {
		this.prodService = prodService;
	}

	public AddPurchaseViewAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AddPurchaseViewAction start");
		
		Product product = new Product();
		product = prodService.getProduct(Integer.parseInt(request.getParameter("prod_no")));
		int amount = Integer.parseInt(request.getParameter("amount"));

		request.setAttribute("product", product);
		request.setAttribute("amount", amount);
		
		System.out.println("AddPurchaseViewAction end");
		return "forward:/purchase/addPurchaseView.jsp";
	}

}
