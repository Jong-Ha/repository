<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="jw.service.user.vo.UserVO" %>\
<%@ page import="jw.service.user.dao.UserDao"%>

<% if(request.getMethod().equals("GET")) {%>
<jsp:forward page="loginJSP.html"/>
<%} %>




	  <%request.setCharacterEncoding("EUC_KR");
		//response.setContentType("text/html;charset=EUC_KR");
		
		//PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		UserVO userVO = new UserVO();
		userVO.setId(id);
		userVO.setPwd(pwd);
		
		UserDao userDAO= new UserDao();
		userDAO.getUser(userVO);
		%>
		
		
		<html>
		<head></head>
		<body>
		<h2>Login ȭ��</h2>
		<% if(userVO.isActive()){ %>
		<% session.setAttribute("userVO",userVO); %>
		<%= id %> �� ȯ���մϴ�.
		<%}else{ %>
		id,pwd�� �Է��ϼ���.
		<%} %>
		<p/><p/><a href='/edu/jw07/loginJSP.html'>�ڷ�</a>
		</body>
		</html>
	
	
			
		
		
	