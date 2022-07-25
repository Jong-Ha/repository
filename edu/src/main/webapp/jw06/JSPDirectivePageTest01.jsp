<%@ page contentType ="text/html; charset=euc-kr" %>
<%@ page import ="java.util.*" %>

<%@ page language="java" %>
<%@ page info="처음 작성하는 JSP" %>
<%@ page session="true"%>
<%@ page isThreadSafe="true" %>

<%String value = "지역변수";
 System.out.println("::"+value);
 
 Calendar calendar = Calendar.getInstance();
 int year = calendar.get(Calendar.YEAR);
 System.out.println("::"+year+" 년");

 String info = getServletInfo();
 System.out.println(":: information : "+info);%>

 <html>
 <head>
 <title>JSPDirectivePageTest01</title>
 </head>
 <body>
  안녕하세요 html 시작<br/>
  <hr/>
  <%="::"+value %><br/>
  <%="::"+year+"년"%><br/>
  <%=":: information: "+info %><br/>
  <hr/>
  안녕하세요 html 끝<br/>
  </body>
  </html>
