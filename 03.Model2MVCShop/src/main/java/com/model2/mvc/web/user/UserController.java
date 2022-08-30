package com.model2.mvc.web.user;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService service;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	public UserController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(@CookieValue(value = "keepId", required = false) String userId, @CookieValue(value = "keepLogin", required = false) String password, HttpSession session) {
		User user = new User();
		user.setUserId(userId);
		user.setPassword(password);
		try {
			User dbVO=service.loginUser(user);
			
			session.setAttribute("user", dbVO);
		}catch (Exception e) {
			System.out.println("로그인 실패");
		}
		return "forward:/index.jsp";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "forward:/user/loginView.jsp";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session) {
		try {
			User dbVO=service.loginUser(user);
			
			session.setAttribute("user", dbVO);
		}catch (Exception e) {
			System.out.println("로그인 실패");
		}
		
		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "addUser", method = RequestMethod.GET)
	public String addUser() {
		return "redirect:/user/addUserView.jsp";
	}

	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user) throws Exception {
		service.addUser(user);
		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping(value = "checkDuplication", method = RequestMethod.POST)
	public String checkDuplication(@RequestParam("userId") String userId, Model model) throws Exception {
		boolean result=service.checkDuplication(userId);
		
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);
		
		return "forward:/user/checkDuplication.jsp";
	}
	
	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(@RequestParam("userId") String userId, HttpSession session, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		User vo=service.getUser(userId);
		
		model.addAttribute("vo", vo);
		
		if(user.getUserId().equals(userId)) {
			session.setAttribute("user", vo);
		}
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) {
		
		session.removeAttribute("user");
		Cookie cookie = new Cookie("keepLogin", null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		
		return "redirect:/";
	}

	@RequestMapping(value = "updateUser", method = RequestMethod.GET)
	public String updateUser(@RequestParam("userId") String userId, Model model) throws Exception {
		
		User user=service.getUser(userId);
		
		model.addAttribute("vo", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user) throws Exception {
		
		service.updateUser(user);
		
		return "redirect:/user/getUser?userId="+user.getUserId();
	}
	
	@RequestMapping(value = "listUser")
	public String listUser(@ModelAttribute("search") Search search, Model model) throws Exception {

		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);

		Map<String,Object> map=service.getUserList(search);
		
		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());

		model.addAllAttributes(map);
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/user/listUser.jsp";
	}

}
