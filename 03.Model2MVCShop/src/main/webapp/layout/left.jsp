<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function history(){
	popWin = window.open("/product/history","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}
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
					<a href="/user/getUser?userId=${ user.userId }" target="rightFrame">개인정보조회</a>
				</td>
			</tr>
		</c:if>
		<c:if test="${ user.role=='admin' }">
			<tr>
				<td class="Depth03" >
					<a href="/user/listUser" target="rightFrame">회원정보조회</a>
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
					<a href="/product/addProduct" target="rightFrame">판매상품등록</a>
				</td>
			</tr>
		</c:if>
		
		<tr>
			<td class="Depth03">
				<a href="/product/listProduct" target="rightFrame">
					${ user.role=='admin'?'판매상품관리':'상 품 검 색' }
				</a>
			</td>
		</tr>
		
		<c:if test="${ user.role=='admin' }">
			<tr>
				<td class="Depth03">
					<a href="/purchase/listDelivery" target="rightFrame">배 송 관 리</a>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${ user.role=='user' }">
			<tr>
				<td class="Depth03">
					<a href="/purchase/listPurchase" target="rightFrame">구매이력조회</a>
				</td>
			</tr>
		</c:if>
		
		
		<c:if test="${ user.role!='admin' }">
			<tr>
				<td class="Depth03">
					<a href="/cart/listCart" target="rightFrame">장 바 구 니</a>
				</td>
			</tr>
		</c:if>
		
		
		<c:if test="${ user.role=='user' }">
			<tr>
				<td class="Depth03">
					<a href="/review/myReview" target="rightFrame">내가 쓴 리뷰</a>
				</td>
			</tr>
		</c:if>
			
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
		
		<tr>
			<td class="Depth03">
			<a href="javascript:history()">최근 본 상품</a>
			</td>
		</tr>
	</table>
</td>
</tr>

</table>
</body>
</html>