package com.model2.mvc.web.product;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.UploadFile;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService service;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['productFilePath']}")
	String productFilePath;

	public ProductRestController() {
		System.out.println(this.getClass());
	}


	@RequestMapping(value = "/json/addProduct", method = RequestMethod.POST)
//	public Product addProduct(@RequestBody Product product, MultipartHttpServletRequest multi) throws Exception {
	public Product addProduct(@RequestBody Product product) throws Exception {
		
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		
		service.addProduct(product);
		
		return product;
	}
	
	@RequestMapping(value = "/json/updateProduct", method = RequestMethod.POST)
//	public String updateProduct(@ModelAttribute("product") Product product, MultipartHttpServletRequest multi, @RequestParam(value = "deteleFileList", required = false) List<String> deleteFileList, Map<String, Object> map) throws Exception{
	public Product updateProduct(@RequestBody Product product, @RequestParam(value = "deteleFileList", required = false) List<String> deleteFileList, Map<String, Object> map) throws Exception{
		map.put("deleteFileList", deleteFileList);
		
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		
		map.put("product", product);
		service.updateProduct(map);
		
		return service.getProduct(product.getProdNo());
	}

//	@RequestMapping(value = "/json/getProduct", method = RequestMethod.GET)
//	public String getProduct(@RequestParam("prodNo") int prodNo, HttpSession session, Model model, HttpServletResponse response, @RequestParam(value = "flag", required = false) String flag, @CookieValue(value = "history", required = false) String history) throws Exception{
//		
//		Product product = service.getProduct(prodNo);
//		model.addAttribute("product", product);
//		
//		String result = "";
//		
//		String userRole = "user";
//		User user = (User)session.getAttribute("user");
//		if(user!=null && user.getRole().equals("admin")) {
//			userRole = "admin";
//		}
//		
//		if(userRole.equals("admin")&&flag==null) {
//			result = "forward:/product/updateProduct?prodNo="+prodNo;
//		}else {
//			result = "forward:/product/getProduct.jsp?prodNo="+prodNo;
//		}
//		
//		
////		ÄíÅ°°ü¸®
//		if(history!=null) {
//			history = URLDecoder.decode(history,"EUC_KR");
//		}else {
//			history = "";
//		}
//		
//		String[] histories = history.split(",");
//		history = "";
//		if(histories.length>0) {
//			for(String str : histories) {
//				if(str!=null && str.length()>4 && Integer.parseInt(str) != prodNo ) {
//					history+= (history.length()==0?"":",")+str;
//				}
//			}
//		}
//
//		history+= (history.length()==0?"":",")+prodNo;
//		
//		Cookie cookie = new Cookie("history", URLEncoder.encode(history,"EUC_KR"));
//		cookie.setMaxAge(30*60);
//		response.addCookie(cookie);
//		
//		return result;
//	}
//	
//	@RequestMapping("listProduct")
//	public String listProduct(@ModelAttribute("search") Search search , Model model) throws Exception{
//
//		System.out.println(search);
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//			search.setSearchKeyword("");
//		}
//		search.setPageSize(pageSize);
//		search.setPageUnit(pageUnit);
//
//		Map<String, Object> map = service.getProductList(search);
//		
//		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());
//		
//		model.addAllAttributes(map);
//		model.addAttribute("search", search);
//		model.addAttribute("resultPage", resultPage);
//		
//		return "forward:/product/listProduct.jsp";
//	}
//
//	@RequestMapping(value = "/json/history", method = RequestMethod.GET)
//	public String history(HttpServletRequest request, Model model) throws Exception {
//		
//		Cookie[] cookies = request.getCookies();
//		String history="";
//		for(Cookie c : cookies) {
//			if(c.getName().equals("history")) {
//				history = URLDecoder.decode(c.getValue(),"EUC_KR");
//			}
//		}
//		
//		if(!history.equals("")) {
//			List<String> list = new ArrayList<String>();
//			
//			String[] records = history.trim().split(",");
//			for(String str : records) {
//				list.add(0,str);
//			}
//			
//			model.addAttribute("list", list);
//		}
//		
//		return "forward:/history.jsp";
//	}

}
