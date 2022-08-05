package com.model2.mvc.view;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import com.model2.mvc.framework.Action;

@Controller("historyAction")
public class HistoryAction extends Action {

	public HistoryAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("historyAction start");
		
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
			
			request.setAttribute("list", list);
		}
		
		System.out.println("historyAction end");
		return "forward:/history.jsp";
	}

}
