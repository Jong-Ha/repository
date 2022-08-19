<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('td.Depth03:contains("개인정보조회")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${ user.userId }");
		})
		$('td.Depth03:contains("회원정보조회")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
		})
		$('td.Depth03:contains("판매상품등록")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/addProduct");
		})
		$('td.Depth03:contains("판매상품관리"), td.Depth03:contains("상 품 검 색")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct");
		})
		$('td.Depth03:contains("배 송 관 리")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listDelivery");
		})
		$('td.Depth03:contains("구매이력조회")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
		})
		$('td.Depth03:contains("장 바 구 니")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/cart/listCart");
		})
		$('td.Depth03:contains("내가 쓴 리뷰")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/review/myReview");
		})
		$('td.Depth03:contains("최근 본 상품")').bind("click",function(){
			popWin = window.open("/product/history","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		})
	})
</script>
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
		<tr>
		<c:if test="${ !empty user }">
			<tr>
				<td class="Depth03">
					개인정보조회
				</td>
			</tr>
		</c:if>
		<c:if test="${ user.role=='admin' }">
			<tr>
				<td class="Depth03" >
					회원정보조회
				</td>
			</tr>
		</c:if>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>

<!--menu 02 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159">
		<c:if test="${ user.role=='admin' }">
			<tr>
				<td class="Depth03">
					판매상품등록
				</td>
			</tr>
		</c:if>
		
		<tr>
			<td class="Depth03">
					${ user.role=='admin'?'판매상품관리':'상 품 검 색' }
			</td>
		</tr>
		
		<c:if test="${ user.role=='admin' }">
			<tr>
				<td class="Depth03">
					배 송 관 리
				</td>
			</tr>
		</c:if>
		
		<c:if test="${ user.role=='user' }">
			<tr>
				<td class="Depth03">
					구매이력조회
				</td>
			</tr>
		</c:if>
		
		
		<c:if test="${ user.role!='admin' }">
			<tr>
				<td class="Depth03">
					장 바 구 니
				</td>
			</tr>
		</c:if>
		
		
		<c:if test="${ user.role=='user' }">
			<tr>
				<td class="Depth03">
					내가 쓴 리뷰
				</td>
			</tr>
		</c:if>
			
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
		
		<tr>
			<td class="Depth03">
			최근 본 상품
			</td>
		</tr>
	</table>
</td>
</tr>

</table>
</body>
</html>