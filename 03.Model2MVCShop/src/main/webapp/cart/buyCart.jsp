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
구매 완료<br/>
성공 
<c:forEach items="${ success }" var="i">: ${ i }</c:forEach>
<br/>
품절
<c:forEach items="${ soldOut }" var="i">: ${ i }</c:forEach>
<br/>
실패  
<c:forEach items="${ fail }" var="i">: ${ i }</c:forEach>
</body>
</html>