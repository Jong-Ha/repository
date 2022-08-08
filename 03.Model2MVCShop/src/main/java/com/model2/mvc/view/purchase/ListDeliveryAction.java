package com.model2.mvc.view.purchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.common.abs.ListAction;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;

public class ListDeliveryAction extends ListAction {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService service;
	
	public void setService(PurchaseService service) {
		this.service = service;
	}

	public ListDeliveryAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListDeliveryAction start");
		
		Search search = this.getSearchInfo(request);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		map = service.getPurchaseList(map);

		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());
		
		request.setAttribute("search", search);
		request.setAttribute("list", (List<Purchase>)map.get("list"));
		request.setAttribute("resultPage", resultPage);
		
		System.out.println("ListDeliveryAction end");
		return "forward:/purchase/listDelivery.jsp";
	}

}
