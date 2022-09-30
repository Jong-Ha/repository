<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function fncCheck(){
	$('#detailForm').attr('method','post').attr('action','/review/listReview?prodNo=${ product.prodNo }');
}
$(function(){
	$('span').bind('click',function(){
		self.location = '/product/getProduct?prodNo=${ product.prodNo }';
	})
})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form id="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						<span>${ product.prodName }</span> ����
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
	<!-- ���ļ��� ���� -->
	<tr>
		<td colspan="11" height="5" style="margin-right: 15px; float: left;"></td>
	</tr>
	<tr>
		<td align="right" >
			<select name="searchCondition" class="ct_input_g">
				<option value="0" ${ search.searchCondition=='0'?'selected':'' } align="center">�ֽ� ���� ��</option>
				<option value="1" ${ search.searchCondition=='1'?'selected':'' } align="center">���� ���� ��</option>
				<option value="2" ${ search.searchCondition=='2'?'selected':'' } align="center">���� ���� ��</option>
			</select>
		</td>
	</tr>
	<!-- ���ļ��� ���� �� -->
	
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="3" >��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ search.currentPage } ������</td>
	</tr>
	<tr>
		<td bgcolor="D6D7D6" width="300" height="2"></td>
		<td bgcolor="D6D7D6" height="2"></td>
		<td bgcolor="D6D7D6" height="2"></td>
	</tr>
	<c:forEach var="i" items="${ list }">
		<tr class="ct_list_pop">
			<td align="center" rowspan="5"><img src = "/images/reviewImg/${ i.fileList[0].fileName }" style="width: 70%; max-height: 100px;"/></td>
			<td></td>
			<td align="left" height="30">
				<c:if test="${ i.grade == 1 }">�ڡ١١١�</c:if>
				<c:if test="${ i.grade == 2 }">�ڡڡ١١�</c:if>
				<c:if test="${ i.grade == 3 }">�ڡڡڡ١�</c:if>
				<c:if test="${ i.grade == 4 }">�ڡڡڡڡ�</c:if>
				<c:if test="${ i.grade == 5 }">�ڡڡڡڡ�</c:if>
				(�ۼ��� : ${ i.reviewDate })
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="D6D7D6" height="1"></td>
		</tr>
		<tr class="ct_list_pop">
			<td></td>
			<td align="left" height="30">�ۼ��� : ${ i.userId }</td>
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
<!--  ������ Navigator �� -->

</form>

</div>
<script type="text/javascript">
$(function(){
	$('select[name="searchCondition"]').bind('change',function(){
		fncPageNavigator('1');
	})
})
</script>
</body>
</html>
