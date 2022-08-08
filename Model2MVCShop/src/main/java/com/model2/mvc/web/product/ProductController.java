package com.model2.mvc.web.product;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.CommonUtil;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService service;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/addProduct.do")
	public String addProduct(@ModelAttribute("product") Product product) throws Exception {
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		service.addProduct(product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping("/addProductView.do")
	public String addProductView(){
		return "forward:/product/addProductView.jsp";
	}
	
	@RequestMapping("/getProduct.do")
	public String getProduct(@RequestParam("prodNo") int prodNo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Product product = service.getProduct(prodNo);
		request.setAttribute("product", product);
		
		String result = "";
		String flag = CommonUtil.null2str((String)request.getAttribute("flag"));
		
		String userRole = "user";
		User user = (User)request.getSession().getAttribute("user");
		if(user!=null && user.getRole().equals("admin")) {
			userRole = "admin";
		}
		
		if(userRole.equals("admin")&&!flag.equals("update")) {
			result = "forward:/updateProductView.do?prodNo="+prodNo;
		}else {
			result = "forward:/product/getProduct.jsp?prodNo="+prodNo;
		}
		
		
//		ÄíÅ°°ü¸®
		Cookie[] cookies = request.getCookies();
		String history = "";
		
		if(cookies!=null && cookies.length>0) {
			for(Cookie c : cookies) {
				if(c.getName().equals("history")) {
					history = URLDecoder.decode(c.getValue(),"EUC_KR");
				}
			}
		}
		
		String[] histories = history.split(",");
		history = "";
		if(histories.length>0) {
			for(String str : histories) {
				if(str!=null && str.length()>4 && Integer.parseInt(str) != prodNo ) {
					history+= (history.length()==0?"":",")+str;
				}
			}
		}

		history+= (history.length()==0?"":",")+prodNo;
		
		Cookie cookie = new Cookie("history", URLEncoder.encode(history,"EUC_KR"));
		response.addCookie(cookie);
		
		return result;
	}
	
	@RequestMapping("/listProduct.do")
	public String listProduct(@ModelAttribute("search") Search search, @RequestParam(value = "menu", required = false) String menu , Model model) throws Exception{

		System.out.println(search);
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
			search.setSearchKeyword("");
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);

		Map<String, Object> map = service.getProductList(search);
		
		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());
		
		model.addAttribute("list", (List<Product>)map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("menu", menu);
		
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping("/updateProduct.do")
	public String updateProduct(@ModelAttribute("product") Product product, Model model) throws Exception{
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		
		service.updateProduct(product);
		
		model.addAttribute("flag", "update");
		
		System.out.println("UpdateProductAction end");
		return "forward:/getProduct.do";
	}
	
	@RequestMapping("/updateProductView.do")
	public String updateProductView() throws Exception{
		return "forward:/product/updateProductView.jsp";
	}

}
