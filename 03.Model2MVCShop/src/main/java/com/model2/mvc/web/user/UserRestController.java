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
		String userId = user.getUserId();
		boolean result=service.checkDuplication(userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", new Boolean(result));
		map.put("userId", userId);
		
		return map;
	}
	
	@RequestMapping(value = "/json/logout", method = RequestMethod.GET)
	public void logout(HttpSession session) {
		
		session.removeAttribute("user");
		
	}

	@RequestMapping(value = "/json/updateUser/{userId}", method = RequestMethod.GET)
	public User updateUser(@PathVariable String userId) throws Exception {
		
		User user=service.getUser(userId);
		
		return user;
	}

	@RequestMapping(value = "/json/updateUser", method = RequestMethod.POST)
	public User updateUser(@RequestBody User user) throws Exception {
		
		service.updateUser(user);
		
		return user;
	}
	
	@RequestMapping(value = "/json/listUser")
	public Map<String,Object> listUser(@RequestBody(required = false) Search search) throws Exception {
		
		if(search==null) {
			search = new Search();
		}
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);

		Map<String,Object> map=service.getUserList(search);
		
		Page resultPage = new Page(search, ((Integer)map.get("totalCount")).intValue());

		map.put("search", search);
		map.put("resultPage", resultPage);
		
		return map;
	}

}
