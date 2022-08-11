<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>

<title>열어본 상품 보기</title>

</head>
<body>
	당신이 열어본 상품을 알고 있다
<br>
<br>
<c:forEach var="i" items="${ list }">
	<a href="/product/getProduct?prodNo=${ i }&menu=search"	target="rightFrame" onclick="window.close()">${ i }</a>
	<br>
</c:forEach>
</body>
</html>