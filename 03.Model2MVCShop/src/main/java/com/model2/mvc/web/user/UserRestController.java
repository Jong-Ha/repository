package com.model2.mvc.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService service;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	public UserRestController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "/json/login", method = RequestMethod.POST)
	public User login(@RequestBody User user, HttpSession session) {
		try {
			User dbVO=service.loginUser(user);
			
			session.setAttribute("user", dbVO);
			user = dbVO;
		}catch (Exception e) {
			System.out.println("로그인 실패");
		}
		
		return user;
	}

	@RequestMapping(value = "/json/getUser/{userId}", method = RequestMethod.GET)
	public User getUser(@PathVariable String userId, HttpSession session) throws Exception {
		
		User user=service.getUser(userId);
		
		return user;
	}
	
	@RequestMapping(value = "/json/addUser", method = RequestMethod.POST)
	public User addUser(@RequestBody User user) throws Exception {
		service.addUser(user);
		return user;
	}
	
	@RequestMapping(value = "/json/checkDuplication", method = RequestMethod.POST)
	public Map<String, Object> checkDuplication(@RequestBody User user) throws Exception {
		boolean result=service.checkDuplication(user.getUserId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", new Boolean(result));
		map.put("userId", user.getUserId());
		
		return map;
	}
	
//	@RequestMapping(value = "logout", method = RequestMethod.GET)
//	public String logout(HttpSession session) {
//		
//		session.removeAttribute("user");
//		
//		return "redirect:/index.jsp";
//	}
//
//	@RequestMapping(value = "updateUser", method = RequestMethod.GET)
//	public String updateUser(@RequestParam("userId") String userId) throws Exception {
//		
//		User user=service.getUser(userId);
//		
//		model.addAttribute("vo", user);
//		
//		return "forward:/user/updateUser.jsp";
//	}
//
//	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
//	public String updateUser(@ModelAttribute("user") User user) throws Exception {
//		
//		service.updateUser(user);
//		
//		return "redirect:/user/getUser?userId="+user.getUserId();
//	}
//	
//	@RequestMapping(value = "listUser")
//	public String listUser(@ModelAttribute("search") Search search) throws Exception {
//
//		
//		System.out.println(search);
//		
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		search.setPageUnit(pageUnit);
//
//		System.out.println(search.getPageSize());
//		System.out.println(search.getPageUnit());
//		System.out.println(search.getCurrentPage());
//		Map<String,Object> map=service.getUserList(search);
//		
//		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());
//
//		model.addAllAttributes(map);
//		model.addAttribute("search", search);
//		model.addAttribute("resultPage", resultPage);
//		
//		return "forward:/user/listUser.jsp";
//	}

}
