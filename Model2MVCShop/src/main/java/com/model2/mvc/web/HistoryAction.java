package com.model2.mvc.web;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HistoryAction {

	public HistoryAction() {
	}

	@RequestMapping("/history.do")
	public String history(HttpServletRequest request, Model model) throws Exception {
		
		Cookie[] cookies = request.getCookies();
		String history="";
		for(Cookie c : cookies) {
			if(c.getName().equals("history")) {
				history = URLDecoder.decode(c.getValue(),"EUC_KR");
			}
		}
		
		if(!history.equals("")) {
			List<String> list = new ArrayList<String>();
			
			String[] records = history.trim().split(",");
			for(String str : records) {
				list.add(0,str);
			}
			
			model.addAttribute("list", list);
		}
		
		return "forward:/history.jsp";
	}

}
