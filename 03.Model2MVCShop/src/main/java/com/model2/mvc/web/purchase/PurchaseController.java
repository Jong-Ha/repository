package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@Controller
public class PurchaseController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService service;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService prodService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/addPurchase.do")
	public ModelAndView addPurchase(HttpSession session, @ModelAttribute("purchase") Purchase purchase, @RequestParam("prodNo") int prodNo) throws Exception {
		
		ModelAndView mv = new ModelAndView();

		User user = (User)session.getAttribute("user");
		Product product = prodService.getProduct(prodNo);
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		
		service.addPurchase(purchase);
		
		mv.addObject("purchase", purchase);
		mv.setViewName("forward:/purchase/addPurchase.jsp");
	
		return mv;
	}
	
	@RequestMapping("/addPurchaseView.do")
	public ModelAndView addPurchaseView(@RequestParam("prodNo") int prodNo, @RequestParam("amount") int amount) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		Product product = new Product();
		product = prodService.getProduct(prodNo);

		mv.addObject("product", product);
		mv.addObject("amount", amount);
		
		mv.setViewName("forward:/purchase/addPurchaseView.jsp");
		return mv;
	}
	
	@RequestMapping("/canclePurchase.do")
	public ModelAndView canclePurchase(@RequestParam("tranNo") int tranNo) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		Purchase purchase = new Purchase();
		purchase.setTranNo(tranNo);
		purchase.setTranCode("4");
		
		service.canclePurchase(purchase);
	
		mv.setViewName("forward:/listPurchase.do");
		return mv;
	}
	
	@RequestMapping("/getPurchase.do")
	public ModelAndView getPurchase(@RequestParam("tranNo") int tranNo) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		Purchase purchase = service.getPurchase(tranNo);
		
		mv.addObject("purchase", purchase);
	
		mv.setViewName("forward:/purchase/getPurchase.jsp");
		return mv;
	}
	
	@RequestMapping("/listDelivery.do")
	public ModelAndView listDelivery(@ModelAttribute("search") Search search) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		map = service.getPurchaseList(map);

		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());
		
		mv.addAllObjects(map);
		mv.addObject("resultPage", resultPage);
	
		mv.setViewName("forward:/purchase/listDelivery.jsp");
		return mv;
	}
	
	@RequestMapping("/listPurchase.do")
	public ModelAndView listPurchase(@ModelAttribute("search") Search search, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
		
		map = service.getPurchaseList(map);

		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());
		
		mv.addAllObjects(map);
		mv.addObject("resultPage", resultPage);
	
		mv.setViewName("forward:/purchase/listPurchase.jsp");
		return mv;
	}
	
	@RequestMapping("/updatePurchase.do")
	public ModelAndView updatePurchase(@ModelAttribute("purchase") Purchase purchase, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		purchase.setBuyer((User)session.getAttribute("user"));
		
		service.updatePurchase(purchase);
	
		mv.setViewName("redirect:/getPurchase.do?tranNo="+purchase.getTranNo());
		return mv;
	}
	
	@RequestMapping("/updatePurchaseView.do")
	public ModelAndView updatePurchaseView(@RequestParam("tranNo") int tranNo) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		Purchase purchase = new Purchase();
		
		purchase = service.getPurchase(tranNo);
		
		mv.addObject("purchase", purchase);
	
		mv.setViewName("forward:/purchase/updatePurchaseView.jsp");
		return mv;
	}
	
	@RequestMapping("/updateTranCode.do")
	public ModelAndView updateTranCode(HttpSession session, @ModelAttribute("purchase") Purchase purchase) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		service.updateTranCode(purchase);
		
		if(((User)session.getAttribute("user")).getRole().equals("user")) {
			mv.setViewName("forward:/listPurchase.do");
		}else{
			mv.setViewName("forward:/listDelivery.do");
		}
		
		return mv;
	}

}
