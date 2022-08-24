<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('td[align="center"]').bind("click",function(){
			if($(this).text().trim()=='login'){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/login");
			}
			if($(this).text().trim()=='logout'){
				$(window.parent.document.location).attr("href","/user/logout");
			}
		})
		
		$('h2').bind("click",function(){
			$(window.parent.document.location).attr("href","/");
		})
		
		$('img').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/login");
		})
	})
</script>
<style type="text/css">
	td[align="center"] {
		cursor: pointer;
	}
</style>
</head>

<body topmargin="0" leftmargin="0">
 
<table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="800" height="30"><h2>Model2 MVC Shop</h2></td>
    <td height="30" ><c:if test="${ !empty user }">${ user.userId }님 환영합니다.</c:if></td>
  </tr>
  <tr>
    <td height="20" width="800" background="/images/img_bg.gif">&nbsp;</td>
    <td height="20" align="left" background="/images/img_bg.gif">
	<table width="100" border="0" cellspacing="0" cellpadding="0">
		<tr> 
			<td align="center">
				<c:if test="${ empty user }">login</c:if>
				<c:if test="${ !empty user }">logout</c:if>  
			</td>
		</tr>
	</table>
    </td>
  </tr>
</table>
 <img  src="//pics.gmarket.co.kr/pc/single/kr/common/image__header-cart.svg" 
 		style="width: 25px; height: 25px; float: right; margin-right: 200px; cursor: pointer;">	
</body>
</html>
