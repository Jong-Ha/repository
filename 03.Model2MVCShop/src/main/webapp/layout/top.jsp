<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">

</head>

<body topmargin="0" leftmargin="0">
 
<table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="800" height="30"><h2><a href="/index.jsp" target="_parent">Model2 MVC Shop</a></h2></td>
    <td height="30" ><c:if test="${ !empty user }">${ user.userId }님 환영합니다.</c:if></td>
  </tr>
  <tr>
    <td height="20" width="800" background="/images/img_bg.gif">&nbsp;</td>
    <td height="20" align="left" background="/images/img_bg.gif">
	<table width="100" border="0" cellspacing="0" cellpadding="0">
		<tr> 
			<td align="center"> 	
				<c:if test="${ empty user }">
				<a href="/loginView.do" target="rightFrame">login</a>
				</c:if>
				<c:if test="${ !empty user }">
				<a href="/logout.do" target="_parent">logout</a>  
				</c:if>  
			</td>
		</tr>
	</table>
    </td>
  </tr>
</table>
<a href="/user/loginView.jsp" target="rightFrame">
 <img  src="//pics.gmarket.co.kr/pc/single/kr/common/image__header-cart.svg" 
 		style="width: 25px; height: 25px; float: right; margin-right: 200px; cursor: pointer;">	
 		</a>
    
</body>
</html>
