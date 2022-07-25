<%@ page contentType="text/html;charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- c:forTokens는 java.util.StringTokenizer 와 비교 -->

1. 홍길동#이순신#김유신#세종대왕#장수왕의 문자열을 #를 구분자로 추출<br/>
		<c:forTokens	var="i" 
							items="홍길동#이순신#김유신#세종대왕#장수왕"
							delims="# ">
			이름1 : ${ i } <br/>
			이름2 : <c:out value="${ i }" /><br/><br/>
		</c:forTokens>

	<br/><hr/>
	
2. 홍길동#이순신#김유신#세종대왕#장수왕의 문자열을 #를 구분자로 추출<br/>
	&nbsp&nbsp c:set을 이용하여보면 <br/>
		<c:set var="names" value="홍길동#이순신#김유신#세종대왕#장수왕" />        
		<c:forTokens	var="i" items="${names}"	delims="# ">
			이름 : ${ i } <br/>
		</c:forTokens>