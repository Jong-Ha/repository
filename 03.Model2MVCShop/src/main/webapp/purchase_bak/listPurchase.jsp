<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function fncDelivery(tranNo){
	$('#tranNo').val(tranNo);
	$('#currentPage').val(${ resultPage.currentPage });
	$('#detailForm').attr('method','post').attr('action','/purchase/updateTranCode?tranCode=3').submit();
}
function fncCheck(){
	$('#detailForm').attr('method','post').attr('action',"/purchase/listPurchase");
}
function fncAddReview(tranNo) {
	popWin = window.open("/review/addReview?tranNo="+tranNo,"popWin", "left=300,top=200,width=800,height=500,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
}
$(function(){
	$('.ct_list_pop td:nth-child(5)').bind('click',function(){
		self.location = '/purchase/getPurchase?tranNo='+$(this).parent().attr('id');
	})
	$('span:contains("물건도착")').bind('click',function(){
		fncDelivery($(this).parents(".ct_list_pop").attr('id'));
	})
	$('span:contains("리뷰작성")').bind('click',function(){
		fncAddReview($(this).parents(".ct_list_pop").attr('id'));
	})
})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form id="detailForm">
<input type="hidden" id="tranNo" name="tranNo" value="">
<input type="hidden" id="updateBy" name="updateBy" value="user">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="10">전체 ${ resultPage.totalCount } 건수, 현재 ${ resultPage.currentPage } 페이지</td>
		<td colspan="1" align="right">
			<select name="tranCondition" class="ct_input_g">
				<option value="" ${ search.tranCondition=='0'?'selected':'' } align="center">배송상태조회</option>
				<option value="4" ${ search.tranCondition=='4'?'selected':'' } align="center">구매취소</option>
				<option value="1" ${ search.tranCondition=='1'?'selected':'' } align="center">배송준비</option>
				<option value="2" ${ search.tranCondition=='2'?'selected':'' } align="center">배송중</option>
				<option value="3" ${ search.tranCondition=='3'?'selected':'' } align="center">배송완료</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">받는사람</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="200">수량</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="500">구매일자</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="500">배송상태</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
		<c:forEach var="i" items="${ list }">
			<tr class="ct_list_pop" id="${ i.tranNo }">
				<td align="center">${ i.rowNum }</td>
				<td></td>
				<td align="left">${ i.receiverName }</td>
				<td></td>
				<td align="left">${ i.purchaseProd.prodName }</td>
				<td></td>
				<td align="left">${ i.amount }</td>
				<td></td>
				<td align="left">${ i.orderDate }</td>	
				<td></td>
				<td align="left">
					<c:choose>
						<c:when test="${ i.tranCode==4 }">구매 취소</c:when>
						<c:when test="${ i.tranCode==1 }">배송준비중</c:when>
						<c:when test="${ i.tranCode==2 }">
							배송중 - <span>물건도착</span>
						</c:when>
						<c:when test="${ i.tranCode==3 }">
							배송완료
							<c:if test="${ i.reviewGrade == 0 }">
								- <span>리뷰작성</span>
							</c:if>
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			</tr>
		</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		
		<c:import var="pageNavigator" url="../common/pageNavigator.jsp"/>
		${ pageNavigator }
		
		</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->
</form>

</div>
<script type="text/javascript">
$(function(){
	$('select').bind('change',function(){
		fncPageNavigator('1');
	})
})
</script>
</body>
</html>