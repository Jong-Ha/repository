package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

public class AddPurchaseAction extends Action {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService service;
	
	public void setService(PurchaseService service) {
		this.service = service;
	}

	public AddPurchaseAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AddPurchaseAction start");
		
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = (User)request.getSession().getAttribute("user");
		
		product.setProdNo(Integer.parseInt(request.getParameter("prodNo")));
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setPaymentOption(request.getParameter("paymentOption"));
		purchase.setReceiverName(request.getParameter("receiverName"));
		purchase.setReceiverPhone(request.getParameter("receiverPhone"));
		purchase.setDivyAddr(request.getParameter("receiverAddr"));
		purchase.setDivyRequest(request.getParameter("receiverRequest"));
		purchase.setDivyDate(request.getParameter("receiverDate"));
		purchase.setAmount(Integer.parseInt(request.getParameter("amount")));
		
		service.addPurchase(purchase);
		
		request.setAttribute("purchase", purchase);
		
		System.out.println("AddPurchaseAction end");
		return "forward:/purchase/addPurchase.jsp";
	}

}
