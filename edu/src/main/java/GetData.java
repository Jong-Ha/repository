import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;


public class GetData extends HttpServlet{ 

 public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		res.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = res.getWriter();

		String clientName = req.getParameter("name");
		String clientAddr = req.getParameter("addr");

		System.out.println(clientName+" : "+clientAddr);

		out.println("<html>");
		out.println("<head><title>GetData.java</title></head>");
		out.println("<body>");
		out.println("<h2>Get Test</h2>");
		out.println("<li> 이름 : "+clientName);
		out.println("<li> 주소 : "+clientAddr);
		out.println("<p><p><a href='/edu/getData.html'>뒤로</a>");
		out.println("</body>");
		out.println("</html>");
		out.flush();
		out.close();


	}
}
