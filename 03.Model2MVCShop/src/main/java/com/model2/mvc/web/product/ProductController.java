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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService service;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['productFilePath']}")
	String productFilePath;

	public ProductController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "addProduct", method = RequestMethod.GET)
	public String addProduct(){
		return "forward:/product/addProductView.jsp";
	}
	
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, @RequestParam("file") MultipartFile file) throws Exception {
		String fileName = file.getOriginalFilename();
		if(!fileName.equals("")) {
			File uploadFile = new File(productFilePath,fileName);
			file.transferTo(uploadFile);
			product.setFileName(fileName);
		}else {
			product.setFileName("../empty.GIF");
		}
		
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		
		service.addProduct(product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value = "updateProduct", method = RequestMethod.GET)
	public String updateProduct() throws Exception{
		return "forward:/product/updateProductView.jsp";
	}

	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product, @RequestParam("file") MultipartFile file, @RequestParam("existFileName") String existFileName) throws Exception{
		String fileName = file.getOriginalFilename();
		if(!fileName.equals("")) {
			File uploadFile = new File(productFilePath,fileName);
			file.transferTo(uploadFile);
			product.setFileName(fileName);
		}else if(!existFileName.equals("")){
			product.setFileName(existFileName);
		}else {
			product.setFileName("../empty.GIF");
		}
		
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		
		service.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&flag=";
	}

	@RequestMapping(value = "getProduct", method = RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") int prodNo, HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "flag", required = false) String flag) throws Exception{
		
		Product product = service.getProduct(prodNo);
		request.setAttribute("product", product);
		
		String result = "";
		
		String userRole = "user";
		User user = (User)request.getSession().getAttribute("user");
		if(user!=null && user.getRole().equals("admin")) {
			userRole = "admin";
		}
		
		if(userRole.equals("admin")&&flag==null) {
			result = "forward:/product/updateProduct?prodNo="+prodNo;
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
		cookie.setMaxAge(30*60);
		response.addCookie(cookie);
		
		return result;
	}
	
	@RequestMapping("listProduct")
	public String listProduct(@ModelAttribute("search") Search search , Model model) throws Exception{

		System.out.println(search);
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
			search.setSearchKeyword("");
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);

		Map<String, Object> map = service.getProductList(search);
		
		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());
		
		model.addAllAttributes(map);
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/product/listProduct.jsp";
	}

	@RequestMapping(value = "history", method = RequestMethod.GET)
	public String history(HttpServletRequest request, Model model) throws Exception {
		
		Cookie[] cookies = request.getCookies();
		String history="";
		for(Cookie c : cookies) {
			if(c.getName().equals("history")) {
				history = URLDecoder.decode(c.getValue(),"EUC_KR");
			}
		}
		
		if(!history.equals("")) {
			List<String> list = new ArrayList<String>();
			
			String[] records = history.trim().split(",");
			for(String str : records) {
				list.add(0,str);
			}
			
			model.addAttribute("list", list);
		}
		
		return "forward:/history.jsp";
	}

}
