package com.model2.mvc.view.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.common.abs.ListAction;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

public class ListUserAction extends ListAction {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService service;

	public void setService(UserService service) {
		this.service = service;
	}
	
	@Override
	public String execute(	HttpServletRequest request,
												HttpServletResponse response) throws Exception {
		Search search = this.getSearchInfo(request);
		
		Map<String,Object> map=service.getUserList(search);

		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());

		request.setAttribute("list", (List<User>)map.get("list"));
		request.setAttribute("search", search);
		request.setAttribute("resultPage", resultPage);
		
		return "forward:/user/listUser.jsp";
	}
}