<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">
<!--
function fncAddPurchase() {
	document.cartPurchase.submit();
}
-->
</script>
</head>

<body>
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