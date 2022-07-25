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
		<h2>Login 화면</h2>
		<% if(userVO.isActive()){ %>
		<% session.setAttribute("userVO",userVO); %>
		<%= id %> 님 환영합니다.
		<%}else{ %>
		id,pwd를 입력하세요.
		<%} %>
		<p/><p/><a href='/edu/jw07/loginJSP.html'>뒤로</a>
		</body>
		</html>
	
	
			
		
		
	