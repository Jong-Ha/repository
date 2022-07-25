import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class HelloServletdoPost extends HttpServlet{

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		this.doPost(req, res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
  
		System.out.println("::servlet doPost () ����");
		System.out.println("Request Client IP : "+req.getRemoteAddr());

		res.setContentType("text/html;charset=EUC_KR");

		PrintWriter out = res.getWriter();

		out.println("<html>");
		out.println("<head><title>hello Servlet</title></head>");
		out.println("<body>");
		out.println("English : HelloServlet");
		out.println("<p>");
		out.println("Korea : ��� ������");
		out.println("</body>");
		out.println("</html>");
		out.flush();
		out.close();

		System.out.println("::servlet service()����\n");
	}

}
