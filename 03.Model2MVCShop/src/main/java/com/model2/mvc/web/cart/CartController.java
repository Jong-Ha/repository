package com.model2.mvc.web.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.cart.CartService;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

@Controller
public class CartController {
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService service;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	public CartController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/addCart.do")
	public String addCart(HttpSession session, @ModelAttribute("cart") Cart cart, @ModelAttribute("product") Product product, Model model) throws Exception {
		
		cart.setProd(product);
		
		User user = (User)session.getAttribute("user");
		if(user!=null) {
			cart.setUserId(user.getUserId());
			service.addCart(cart);
			model.addAttribute("cart", cart);
		}else {
			List<Cart> list = (List<Cart>)session.getAttribute("list");
			if(list==null) {
				list = new ArrayList<Cart>();
			}
			product = productService.getProduct(product.getProdNo());
			cart.setCartNo(list.size()+1);
			cart.setProd(product);
			list.add(cart);
			session.setAttribute("list", list);
		}
		
		return "forward:/cart/addCart.jsp";
	}
	
	@RequestMapping("/buyCart.do")
	public String buyCart(HttpServletRequest request, @ModelAttribute("purchase") Purchase purchase, @ModelAttribute("user") User user
			, @RequestParam("cartNo") int[] cartNoArr, @RequestParam("amount") int[] amountArr, @RequestParam("prodNo") int[] prodNoArr, Model model) throws Exception {

		int arrLength = cartNoArr.length;
		
		purchase.setBuyer(user);
		Product product = new Product();

		List<Integer> successies = new ArrayList<Integer>();
		List<Integer> failes = new ArrayList<Integer>();
		List<Integer> soldOut = new ArrayList<Integer>();
		
		for(int i=0;i<arrLength;i++) {
			int cartNo = cartNoArr[i];
			
			product.setProdNo(prodNoArr[i]);
			purchase.setPurchaseProd(product);
			purchase.setAmount(amountArr[i]);
			String result = service.purchaseCart(purchase,cartNo);
			if(result.equals("success")) {
				successies.add(cartNo);
			}else if(result.equals("soldOut")) {
				soldOut.add(cartNo);
			}else {
				failes.add(cartNo);
			}
		}
		
		model.addAttribute("success", successies);
		model.addAttribute("fail", failes);
		model.addAttribute("soldOut", soldOut);
		
		return "forward:/cart/buyCart.jsp";
	}
	
	@RequestMapping("/buyCartView.do")
	public String buyCartView(HttpServletRequest request, @RequestParam("cartBox") String[] cartBoxArr, Model model) throws Exception {
		
		int arrLength = cartBoxArr.length;
		
		List<Cart> list = new ArrayList<Cart>();
		
		for(int i=0;i<arrLength;i++) {
			Cart cart = new Cart();
			Product prod = new Product();
			prod.setProdNo(Integer.parseInt(request.getParameter(cartBoxArr[i]+"prodNo")));
			cart.setCartNo(Integer.parseInt(request.getParameter(cartBoxArr[i]+"cartNo")));
			cart.setAmount(Integer.parseInt(request.getParameter(cartBoxArr[i]+"amount")));
			cart.setProd(prod);
			service.updateCart(cart);
			list.add(cart);
		}
		
		model.addAttribute("list", list);
		
		System.out.println(list);
		
		return "forward:/cart/buyCartView.jsp";
	}
	
	@RequestMapping("/deleteCart.do")
	public String deleteCart(HttpSession session, HttpServletRequest request, @RequestParam("cartBox") String[] cartBoxArr,@RequestParam("flag") String flag , Model model) throws Exception {

		int arrLength = cartBoxArr.length;
		List<Cart> list = (List<Cart>)session.getAttribute("list");
		
		for(int i=0;i<arrLength;i++) {
			int cartNo = Integer.parseInt(request.getParameter(cartBoxArr[i]+"cartNo"));
			if(flag.equals("check")) {
				int amount = Integer.parseInt(request.getParameter(cartBoxArr[i]+"amount"));
				if(amount==0) {
					if(list==null) {
						service.deleteCart(cartNo);
					}else {
						for(int j = 0; j<list.size(); j++) {
							if(list.get(j).getCartNo()==cartNo) {
								list.remove(j);
								break;
							}
						}
					}
				}
			}else {
				if(list==null) {
					service.deleteCart(cartNo);
				}else {
					for(int j = 0; j<list.size(); j++) {
						if(list.get(j).getCartNo()==cartNo) {
							list.remove(j);
							break;
						}
					}
				}
			}
		}
		
		return "forward:/listCart.do";
	}
	
	@RequestMapping("/listCart.do")
	public String listCart(HttpSession session, @RequestParam(value = "cartBox", required = false) String[] cartBoxArr, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		List<Cart> list = (List<Cart>)session.getAttribute("list");
		int totalPrice = 0;
		
		if(user!=null) {
			if(list!=null) {
				for(Cart cart : list) {
					cart.setUserId(user.getUserId());
					service.addCart(cart);
				}
				session.removeAttribute("list");
			}
			String userId = user.getUserId();
			list = service.getCartList(userId);
		}
		if(list!=null) {
			for(Cart cart : list) {
				if(cart.getAmount()>cart.getProd().getAmount()) {
					cart.setAmount(cart.getProd().getAmount());
				}
				totalPrice += cart.getAmount()*cart.getProd().getPrice();
			}
		}

		model.addAttribute("list", list);
		model.addAttribute("totalPrice", totalPrice);
		
		return "forward:/cart/listCart.jsp";
	}

}
