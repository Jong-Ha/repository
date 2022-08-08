package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;

public class CanclePurchaseAction extends Action {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService service;
	
	public void setService(PurchaseService service) {
		this.service = service;
	}

	public CanclePurchaseAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CanclePurchaseAction start");
		
		int tranNo = Integer.parseInt(request.getParameter("tranNo"));
		
		Purchase purchase = new Purchase();
		purchase.setTranNo(tranNo);
		purchase.setTranCode("4");
		
		service.canclePurchase(purchase);
		
		System.out.println("CanclePurchaseAction end");
		return "forward:/listPurchase.do";
	}

}
