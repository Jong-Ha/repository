package jw04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginBean
 */
//@WebServlet("/LoginBean")
public class LoginBeanInitParam extends HttpServlet {
	
	private String jdbcDriver;
	private String jdbcURL;
	private String jdbcUser;
	private String jdbcPasswd;
	
	public void init(ServletConfig sc)	throws ServletException{
		super.init(sc);
		jdbcDriver = sc.getInitParameter("jdbcDriver");
		jdbcURL = sc.getInitParameter("jdbcURL");
		jdbcUser = sc.getInitParameter("jdbcUser");
		jdbcPasswd = sc.getInitParameter("jdbcPasswd");
		
		System.out.println("web.xml�� ��ϵ� InitParam���� �������� Ȯ��");
		System.out.println("jdbcDriver : "+jdbcDriver);
		System.out.println("jdbcURL : "+jdbcURL);
		System.out.println("jdbcUser : "+jdbcUser);
		System.out.println("jdbcPasswd : "+jdbcPasswd);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC_KR");
		response.setContentType("text/html;charset=EUC_KR");
		PrintWriter out= response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		UserVO userVO = new UserVO();
		userVO.setId(id);
		userVO.setPwd(pwd);
		
		UserInitParamDao dao = new UserInitParamDao();
		dao.setJdbcDriver(jdbcDriver);
		dao.setJdbcURL(jdbcURL);
		dao.setJdbcUser(jdbcUser);
		dao.setJdbcPasswd(jdbcPasswd);
		
		dao.getUser(userVO);
		
		out.println("<html>");
		out.println("<head></head>");
		out.println("<body>");
		
		out.println("<h2>Login ȭ�� </h2>");
		
		if(userVO.isActive()) {
			out.println(id+"�� ȯ���մϴ�.");
		}else {
			out.println("Login ���� id,pwd�� Ȯ���ϼ���.");
		}
		out.println("<p><p><a href='/edu/jw04/loginBean.html'>�ڷ�</a>");
		out.println("</body>");
		out.println("</html>");
		
		}
		
		
	}

