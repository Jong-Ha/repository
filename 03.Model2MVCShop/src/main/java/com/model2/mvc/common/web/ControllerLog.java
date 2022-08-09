package com.model2.mvc.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.service.domain.User;

public class ControllerLog implements HandlerInterceptor {

	public ControllerLog() {
		System.out.println("ControllerLog 기본 생성자");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.print("\n[Controller Log]");
		
		String uri = request.getRequestURI();
		uri = uri.substring(uri.indexOf("/")+1);
		System.out.println(uri+" start");
		return true;
		
	}//end of preHandle

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.print("\n[Controller Log]");
		
		String uri = request.getRequestURI();
		uri = uri.substring(uri.indexOf("/")+1);
		System.out.println(uri+" end");
		
	}//end of postHandle

}
