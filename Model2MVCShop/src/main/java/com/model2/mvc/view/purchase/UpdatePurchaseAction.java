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

public class UpdatePurchaseAction extends Action {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService service;
	
	public void setService(PurchaseService service) {
		this.service = service;
	}

	public UpdatePurchaseAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UpdatePurchaseAction start");
		
		Purchase purchase = new Purchase();
		int tranNo = Integer.parseInt(request.getParameter("tranNo"));
		purchase.setTranNo(tranNo);
		purchase.setBuyer((User)request.getAttribute("user"));
		purchase.setPaymentOption(request.getParameter("paymentOption"));
		purchase.setReceiverName(request.getParameter("receiverName"));
		purchase.setReceiverPhone(request.getParameter("receiverPhone"));
		purchase.setDivyAddr(request.getParameter("receiverAddr"));
		purchase.setDivyRequest(request.getParameter("receiverRequest"));
		purchase.setDivyDate(request.getParameter("divyDate"));
		
		service.updatePurchase(purchase);
		
		System.out.println("UpdatePurchaseAction end");
		return "redirect:/getPurchase.do?tranNo="+tranNo;
	}

}
