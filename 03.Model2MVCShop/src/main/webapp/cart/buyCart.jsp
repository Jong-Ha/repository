<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
���� �Ϸ�<br/>
���� 
<c:forEach items="${ success }" var="i">: ${ i }</c:forEach>
<br/>
ǰ��
<c:forEach items="${ soldOut }" var="i">: ${ i }</c:forEach>
<br/>
����  
<c:forEach items="${ fail }" var="i">: ${ i }</c:forEach>
</body>
</html>