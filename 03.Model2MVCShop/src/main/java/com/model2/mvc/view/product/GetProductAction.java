package com.model2.mvc.view.product;

import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.common.util.CommonUtil;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

@Controller("getProductAction")
public class GetProductAction extends Action {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService service;
	
	public void setProductService(ProductService service) {
		this.service = service;
	}

	public GetProductAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("GetProductAction start");
		
		String prodNo = request.getParameter("prodNo");
		Product product = service.getProduct(Integer.parseInt(prodNo));
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
				if(str!=null && str.length()>4 && !str.equals(prodNo)) {
					history+= (history.length()==0?"":",")+str;
				}
			}
		}

		history+= (history.length()==0?"":",")+prodNo;
		
		Cookie cookie = new Cookie("history", URLEncoder.encode(history,"EUC_KR"));
		response.addCookie(cookie);
		
		System.out.println("GetProductAction end");
		return result;
	}

}
