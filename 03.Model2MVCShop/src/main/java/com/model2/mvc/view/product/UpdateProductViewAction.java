package com.model2.mvc.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;

@Controller("updateProductViewAction")
public class UpdateProductViewAction extends Action {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService service;
	
	public void setProductService(ProductService service) {
		this.service = service;
	}

	public UpdateProductViewAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UpdateProductViewAction start");
		System.out.println("UpdateProductViewAction end");
		return "forward:/product/updateProductView.jsp";
	}

}
