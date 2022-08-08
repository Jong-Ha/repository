package com.model2.mvc.framework;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.test.context.ContextConfiguration;

@ContextConfiguration(locations = {"classpath:config/commonservice.xml"})
public abstract class Action {
	
	private ServletContext servletContext;
	
	public Action(){
	}
	
	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	public abstract String execute(HttpServletRequest request, HttpServletResponse response) throws Exception ;

}