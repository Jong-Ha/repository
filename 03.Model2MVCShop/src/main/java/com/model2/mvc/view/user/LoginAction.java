package com.model2.mvc.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

public class LoginAction extends Action{

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService service;

	public void setService(UserService service) {
		this.service = service;
	}
	
	@Override
	public String execute(	HttpServletRequest request,
												HttpServletResponse response) throws Exception {
		User user=new User();
		user.setUserId(request.getParameter("userId"));
		user.setPassword(request.getParameter("password"));
		System.out.println(service);
		try {
			User dbVO=service.loginUser(user);
			
			HttpSession session=request.getSession();
			session.setAttribute("user", dbVO);
		}catch (Exception e) {
			System.out.println("로그인 실패");
		}
		
		return "redirect:/index.jsp";
	}
}