package com.model2.mvc.web.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

@Controller
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
	
	@RequestMapping("/loginView.do")
	public String loginView() {
		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping("/addUserView.do")
	public String addUserView() {
		return "redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping("/addUser.do")
	public String addUser(@ModelAttribute("user") User user) throws Exception {
		service.addUser(user);
		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping("/checkDuplication.do")
	public String checkDuplication(@RequestParam("userId") String userId, Model model) throws Exception {
		boolean result=service.checkDuplication(userId);
		
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);
		
		return "forward:/user/checkDuplication.jsp";
	}
	
	@RequestMapping("/getUser.do")
	public String getUser(@RequestParam("userId") String userId, HttpSession session, Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		User vo=service.getUser(userId);
		
		model.addAttribute("vo", vo);
		
		if(user.getUserId().equals(userId)) {
			session.setAttribute("user", vo);
		}
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping("/login.do")
	public String login(@ModelAttribute("user") User user, HttpSession session) {
		try {
			User dbVO=service.loginUser(user);
			
			session.setAttribute("user", dbVO);
		}catch (Exception e) {
			System.out.println("로그인 실패");
		}
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		
		session.removeAttribute("user");
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(@ModelAttribute("user") User user) throws Exception {
		
		service.updateUser(user);
		
		return "redirect:/getUser.do?userId="+user.getUserId();
	}
	
	@RequestMapping("/updateUserView.do")
	public String updateUserView(@RequestParam("userId") String userId, Model model) throws Exception {
		
		User user=service.getUser(userId);
		
		model.addAttribute("vo", user);
		
		return "forward:/user/updateUser.jsp";
	}
	
	@RequestMapping("/listUser.do")
	public String listUser(@ModelAttribute("search") Search search, Model model) throws Exception {

		
		System.out.println(search);
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);

		System.out.println(search.getPageSize());
		System.out.println(search.getPageUnit());
		System.out.println(search.getCurrentPage());
		Map<String,Object> map=service.getUserList(search);
		
		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());

		model.addAttribute("list", (List<User>)map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/user/listUser.jsp";
	}

}
