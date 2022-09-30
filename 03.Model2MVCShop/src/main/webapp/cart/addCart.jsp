<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" />
${ !empty cart.userId? cart.userId : 'visitor' } 장바구니 등록 완료
</body>
</html>