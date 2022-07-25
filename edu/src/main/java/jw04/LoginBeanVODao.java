package jw04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
//@WebServlet("/Login")
public class LoginBeanVODao extends HttpServlet {
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		request.setCharacterEncoding("EUC_KR");
		response.setContentType("text/html;charset=EUC_KR");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		UserVO userVO = new UserVO();
		userVO.setId(id);
		userVO.setPwd(pwd);
		
		UserDao userDao = new UserDao();
		userDao.getUser(userVO);
		
		out.println("<html>");
		out.println("<head></head>");
		out.println("<body>");
		out.println("<h2>Login 화면 </h2>");
		
		if(userVO.isActive()) {
			out.println(id+"님 환영합니다.");
		}else {
			out.println("id,pwd를 확인하세요.");
		}
		out.println("<p><p><a href='/edu/jw04/loginBeanVODao.html'>뒤로</a>");
		out.println("</body>");
		out.println("</html>");
			
	}
	
			
		
		
	}

		