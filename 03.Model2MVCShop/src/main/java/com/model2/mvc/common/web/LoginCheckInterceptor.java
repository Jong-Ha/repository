package com.model2.mvc.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.model2.mvc.service.domain.User;

public class LoginCheckInterceptor implements HandlerInterceptor {

	public LoginCheckInterceptor() {
		System.out.println("LoginCheckInterceptor 기본 생성자");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("LoginCheckInterceptor start");
		String uri = request.getRequestURI();
		String json = "";// RestController,Controller
		uri = uri.substring(uri.indexOf("/") + 1);
		String controller = uri.substring(0, uri.indexOf("/"));// user,product...
		uri = uri.substring(uri.indexOf("/") + 1);
		if (uri.indexOf("json") == 0) {
			json = "RestController";
			uri = uri.substring(uri.indexOf("/") + 1);
		} else {
			json = "Controller";
		}
		if (uri.indexOf("/") != -1) {
			uri = uri.substring(0, uri.indexOf("/"));
		}
		if (uri.indexOf("?") != -1) {
			uri = uri.substring(0, uri.indexOf("?"));
		}
		String method = uri;// login,logout...

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		// 비로그인
		if (user == null) {
			if (method.indexOf("checkDuplication") == -1 && method.indexOf("addUser") == -1 && method.indexOf("index") == -1 && method.indexOf("listProduct") == -1 && method.indexOf("login") == -1) {
				request.getRequestDispatcher("/").forward(request, response);
				return false;
			}
		}

		return true;

	}// end of preHandle

}
