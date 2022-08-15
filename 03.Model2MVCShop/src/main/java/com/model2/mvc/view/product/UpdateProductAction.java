package com.model2.mvc.view.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class UpdateProductAction extends Action {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService service;
	
	public void setProductService(ProductService service) {
		this.service = service;
	}

	public UpdateProductAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UpdateProductAction start");
		
		Product product = new Product();
		product.setProdNo(Integer.parseInt(request.getParameter("prodNo")));
		product.setProdName(request.getParameter("prodName"));
		product.setProdDetail(request.getParameter("prodDetail"));
		product.setManuDate(request.getParameter("manuDate").replaceAll("-", ""));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
//		product.setFileName(request.getParameter("fileName"));
		product.setAmount(Integer.parseInt(request.getParameter("amount")));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);
		
		service.updateProduct(map);
		
		request.setAttribute("flag", "update");
		
		System.out.println("UpdateProductAction end");
		return "forward:/getProduct.do?prodNo="+request.getParameter("prodNo");
	}

}
