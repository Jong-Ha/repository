package com.model2.mvc.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.common.util.CommonUtil;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

@Controller("addProductAction")
public class AddProductAction extends Action {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService service;
	
	public void setProductService(ProductService service) {
		this.service = service;
	}

	public AddProductAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AddProductAction start");
		
		Product product = new Product();
		product.setProdName(request.getParameter("prodName"));
		product.setProdDetail(request.getParameter("prodDetail"));
		product.setManuDate(request.getParameter("manuDate").replaceAll("-", ""));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setFileName(request.getParameter("fileName"));
		product.setAmount(Integer.parseInt(request.getParameter("amount")));
		System.out.println(product);
		
		service.addProduct(product);
		request.setAttribute("product", product);
		
		System.out.println("AddProductAction end");
		return "forward:/product/addProduct.jsp";
	}

}
