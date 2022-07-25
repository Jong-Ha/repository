package jw05;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieWriterToClient extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
	
		req.setCharacterEncoding("EUC_KR");
		res.setContentType("text/html;charset=EUC_KR");
		
		PrintWriter out = res.getWriter();
	
		Cookie cookie = new Cookie("name", URLEncoder.encode("홍길동"));
		
		cookie.setMaxAge(60*60);
		//cookie.setMaxAge(-1);
		//cookie.setMaxAge(0);
		res.addCookie(cookie);
		
		out.println("<html><body>");
		out.println("Cookie 저장 완료");
		out.println("</body></html>");
		
		
	}
	
	
	

}
