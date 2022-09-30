<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('span').each(function(){
		$(this).bind('click',function(){
			if(opener) {
				$(opener.document.location).attr("href","/product/getProduct?prodNo="+$(this).text().trim()+"&menu=search");
			}
			window.close();
		})
	})
})
</script>
<title>��� ��ǰ ����</title>

</head>
<body>
	����� ��� ��ǰ�� �˰� �ִ�
<br>
<br>
<c:forEach var="i" items="${ list }">
	<span>${ i }</span>
	<br/>
</c:forEach>
</body>
</html>