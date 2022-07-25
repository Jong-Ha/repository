package jw05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class SessionUseCookieTwo extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		
		
		req.setCharacterEncoding("EUC_KR");
		res.setContentType("text/html;charset=EUC_KR");
		PrintWriter out = res.getWriter();
		
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(int i=0; i<cookies.length;i++) {
				System.out.println("\nCookie에 저장된 정보 : ");
				System.out.println(cookies[i].getName()+" : "+cookies[i].getValue());
				System.out.println("\n");
				
			}
		}
		
		HttpSession session = req.getSession(false);
		
		out.println("<html><head></head>");
		out.println("<body>");
		out.println("<center><h2>SessionUseCookieTwo</h2></center>");
		
		
		if(session !=null) {
			out.println("<hr>JSESSIONID = "+session.getId()+"<hr>");
			String name =(String)session.getAttribute("name");
			out.println("이름 : "+name);
		}else {
			out.println("처음이십니다.");
			
		}
	
		out.println("</body></html>");
	}

}
