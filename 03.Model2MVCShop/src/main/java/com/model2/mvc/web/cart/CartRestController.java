package com.model2.mvc.web.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.cart.CartService;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/cart/*")
public class CartRestController {
	
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

	public CartRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "/json/addCart/{prodNo}", method = RequestMethod.GET)
	public void addCart(HttpSession session, @PathVariable int prodNo) throws Exception {
		
		Product product = productService.getProduct(prodNo);
		
		Cart cart = new Cart();
		
		cart.setProd(product);
		cart.setAmount(1);
		
		User user = (User)session.getAttribute("user");
		if(user!=null) {
			cart.setUserId(user.getUserId());
			service.addCart(cart);
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
		
	}
	/*
	 * @RequestMapping(value = "/json/buyCartView", method = RequestMethod.POST) public String buyCart(HttpServletRequest request, @RequestParam("cartBox") String[] cartBoxArr, Model model) throws Exception {
	 * 
	 * int arrLength = cartBoxArr.length;
	 * 
	 * List<Cart> list = new ArrayList<Cart>();
	 * 
	 * for(int i=0;i<arrLength;i++) { Cart cart = new Cart(); Product prod = new Product(); prod.setProdNo(Integer.parseInt(request.getParameter(cartBoxArr[i]+"prodNo"))); cart.setCartNo(Integer.parseInt(request.getParameter(cartBoxArr[i]+"cartNo"))); cart.setAmount(Integer.parseInt(request.getParameter(cartBoxArr[i]+"amount"))); cart.setProd(prod); service.updateCart(cart); list.add(cart); }
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * System.out.println(list);
	 * 
	 * return "forward:/cart/buyCartView.jsp"; }
	 * 
	 * @RequestMapping(value = "/json/buyCart", method = RequestMethod.POST) public String buyCart(HttpServletRequest request, @ModelAttribute("purchase") Purchase purchase, @ModelAttribute("user") User user , @RequestParam("cartNo") int[] cartNoArr, @RequestParam("amount") int[] amountArr, @RequestParam("prodNo") int[] prodNoArr, Model model) throws Exception {
	 * 
	 * int arrLength = cartNoArr.length;
	 * 
	 * purchase.setBuyer(user); Product product = new Product();
	 * 
	 * List<Integer> successies = new ArrayList<Integer>(); List<Integer> failes = new ArrayList<Integer>(); List<Integer> soldOut = new ArrayList<Integer>();
	 * 
	 * for(int i=0;i<arrLength;i++) { int cartNo = cartNoArr[i];
	 * 
	 * product.setProdNo(prodNoArr[i]); purchase.setPurchaseProd(product); purchase.setAmount(amountArr[i]); String result = service.purchaseCart(purchase,cartNo); if(result.equals("success")) { successies.add(cartNo); }else if(result.equals("soldOut")) { soldOut.add(cartNo); }else { failes.add(cartNo); } }
	 * 
	 * model.addAttribute("success", successies); model.addAttribute("fail", failes); model.addAttribute("soldOut", soldOut);
	 * 
	 * return "forward:/cart/buyCart.jsp"; }
	 * 
	 * @RequestMapping(value = "/json/deleteCart", method = RequestMethod.POST) public String deleteCart(HttpSession session, HttpServletRequest request, @RequestParam("cartBox") String[] cartBoxArr,@RequestParam("flag") String flag , Model model) throws Exception {
	 * 
	 * int arrLength = cartBoxArr.length; List<Cart> list = (List<Cart>)session.getAttribute("list");
	 * 
	 * for(int i=0;i<arrLength;i++) { int cartNo = Integer.parseInt(request.getParameter(cartBoxArr[i]+"cartNo")); if(flag.equals("check")) { int amount = Integer.parseInt(request.getParameter(cartBoxArr[i]+"amount")); if(amount==0) { if(list==null) { service.deleteCart(cartNo); }else { for(int j = 0; j<list.size(); j++) { if(list.get(j).getCartNo()==cartNo) { list.remove(j); break; } } } } }else { if(list==null) { service.deleteCart(cartNo); }else { for(int j = 0; j<list.size(); j++) { if(list.get(j).getCartNo()==cartNo) { list.remove(j); break; } } } } }
	 * 
	 * return "forward:/cart/listCart"; }
	 * 
	 * @RequestMapping("/json/listCart") public String listCart(HttpSession session, @RequestParam(value = "cartBox", required = false) String[] cartBoxArr, Model model) throws Exception {
	 * 
	 * User user = (User)session.getAttribute("user"); List<Cart> list = (List<Cart>)session.getAttribute("list"); int totalPrice = 0;
	 * 
	 * if(user!=null) { if(list!=null) { for(Cart cart : list) { cart.setUserId(user.getUserId()); service.addCart(cart); } session.removeAttribute("list"); } String userId = user.getUserId(); list = service.getCartList(userId); } if(list!=null) { for(Cart cart : list) { if(cart.getAmount()>cart.getProd().getAmount()) { cart.setAmount(cart.getProd().getAmount()); } totalPrice += cart.getAmount()*cart.getProd().getPrice(); } }
	 * 
	 * model.addAttribute("list", list); model.addAttribute("totalPrice", totalPrice);
	 * 
	 * return "forward:/cart/listCart.jsp"; }
	 */
}
