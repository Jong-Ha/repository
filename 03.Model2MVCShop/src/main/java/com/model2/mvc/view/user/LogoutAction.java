package com.model2.mvc.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.user.UserService;

public class LogoutAction extends Action {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService service;

	public void setService(UserService service) {
		this.service = service;
	}
	
	@Override
	public String execute(	HttpServletRequest request,
												HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		session.invalidate();

		return "redirect:/index.jsp";
	}
}