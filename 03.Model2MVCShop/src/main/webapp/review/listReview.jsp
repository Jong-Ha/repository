<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncCheck(){
	
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/review/listReview?prodNo=${ product.prodNo }" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						<a href="/product/getProduct?prodNo=${ product.prodNo }">${ product.prodName }</a> 리뷰
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<!-- 정렬순서 변경 -->
	<tr>
		<td colspan="11" height="5" style="margin-right: 15px; float: left;"></td>
	</tr>
	<tr>
		<td align="right" >
			<select name="searchCondition" class="ct_input_g" onchange="fncPageNavigator('1')">
				<option value="0" ${ search.searchCondition=='0'?'selected':'' } align="center">최신 리뷰 순</option>
				<option value="1" ${ search.searchCondition=='1'?'selected':'' } align="center">평점 높은 순</option>
				<option value="2" ${ search.searchCondition=='2'?'selected':'' } align="center">평점 낮은 순</option>
			</select>
		</td>
	</tr>
	<!-- 정렬순서 변경 끝 -->
	
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="3" >전체 ${ resultPage.totalCount } 건수, 현재 ${ search.currentPage } 페이지</td>
	</tr>
	<tr>
		<td bgcolor="D6D7D6" width="300" height="2"></td>
		<td bgcolor="D6D7D6" height="2"></td>
		<td bgcolor="D6D7D6" height="2"></td>
	</tr>
	<c:forEach var="i" items="${ list }">
	<tr class="ct_list_pop">
		<td align="center" rowspan="5"><img src = "/images/reviewImg/${ i.fileName }" width="200"/></td>
		<td></td>
		<td align="left">
			<c:if test="${ i.grade == 1 }">★☆☆☆☆</c:if>
			<c:if test="${ i.grade == 2 }">★★☆☆☆</c:if>
			<c:if test="${ i.grade == 3 }">★★★☆☆</c:if>
			<c:if test="${ i.grade == 4 }">★★★★☆</c:if>
			<c:if test="${ i.grade == 5 }">★★★★★</c:if>
			(작성일 : ${ i.reviewDate })
		</td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<tr class="ct_list_pop">
		<td></td>
		<td align="left">작성자 : ${ i.userId }</td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<tr class="ct_list_pop">
		<td></td>
		<td align="left">${ i.detail }</td>
	</tr>
	<tr>
		<td colspan="3" bgcolor="D6D7D6" height="2"></td>
	</tr>
		</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">

			<jsp:include page="../common/pageNavigator.jsp"/>
			
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
