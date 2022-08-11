<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncCheck(){
}
function fncUpdateReview(tranNo){
	popWin = window.open("/review/updateReview?tranNo="+tranNo,"popWin", "left=300,top=200,width=800,height=500,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
}
</script>
<style type="text/css">
.tdleft{
	margin-right: 0px; 
	float: right;"
}
</style>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/review/myReview" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						���� �� ����
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<%-- 
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<c:if test="${ user.role == 'admin' }">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
					<option value="0" ${ search.searchCondition == '0'? 'selected' : '' }>��ǰ��</option>
					<option value="1" ${ search.searchCondition == '1'? 'selected' : '' }>��ǰ��ȣ</option>
				</select>
			</c:if>
			
			<input type="text" name="searchKeyword"  class="ct_input_g" 
				style="width:${ user.role=='admin'? '200' : '300'}px; height:19px" value="${ search.searchKeyword }"/>
		</td>
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncPageNavigator('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
  	<!-- ��ۻ��� ��ȸ -->
	<c:if test="${ menu=='manage' }">
		<tr>
			<td colspan="11" height="5"></td>
		</tr>
		<tr>
			<td align="right">
				<select name="tranCondition" class="ct_input_g">
					<option value="0" ${ search.tranCondition=='0'?'selected':'' } align="center">��ۻ�����ȸ</option>
					<option value="1" ${ search.tranCondition=='1'?'selected':'' } align="center">���ſϷ�</option>
					<option value="2" ${ search.tranCondition=='2'?'selected':'' } align="center">�����</option>
					<option value="3" ${ search.tranCondition=='3'?'selected':'' } align="center">��ۿϷ�</option>
				</select>
			</td>
		</tr>
	</c:if>
	<!-- ��ۻ��� ��ȸ �� -->
	
	<!-- ���ļ��� ���� -->
	<c:if test="${ user.role != 'admin' }">
		<tr>
			<td colspan="11" height="5" style="margin-right: 15px; float: left;"></td>
		</tr>
		<tr>
			<td class="tdleft" >
				<select name="prodListCondition" class="ct_input_g" onchange="fncPageNavigator('1')">
					<option value="0" ${ search.prodListCondition=='0'?'selected':'' } align="center">�ű� ��ǰ ��</option>
					<option value="1" ${ search.prodListCondition=='1'?'selected':'' } align="center">���� ���� ��</option>
					<option value="2" ${ search.prodListCondition=='2'?'selected':'' } align="center">���� ���� ��</option>
				</select>
			</td>
			<td class="tdleft">&nbsp;</td>
			<td align="right" class="tdleft">
				���� �˻� 
				<input id="minPriceInput" name="minPriceInput" value="${ search.minPrice==0 ?'':search.minPrice }" size="4">~<input id="maxPriceInput" name="maxPriceInput" value="${ search.maxPrice==0 ?'':search.maxPrice }" size="4">
			</td>
		</tr>
	</c:if>
	<!-- ���ļ��� ���� �� -->
	
</table>
 --%>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="4" >��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ search.currentPage } ������</td>
		<td colspan="1" align="right" ></td>
	</tr>
	<tr>
		<td colspan="1" bgcolor="D6D7D6" height="2" width="300"></td>
		<td colspan="1" bgcolor="D6D7D6" height="2"></td>
		<td colspan="1" bgcolor="D6D7D6" height="2" width="200"></td>
		<td colspan="1" bgcolor="D6D7D6" height="2"></td>
		<td colspan="1" bgcolor="D6D7D6" height="2"></td>
	</tr>
	<c:forEach var="i" items="${ list }">
		<tr class="ct_list_pop" height="300">
			<td align="center" rowspan="3"><img src = "/images/uploadFiles/${ i.prod.fileName }" width="150"/></td>
			<td></td>
			<td align="left" colspan="3">
				<c:if test="${ i.grade == 1 }">�ڡ١١١�</c:if>
				<c:if test="${ i.grade == 2 }">�ڡڡ١١�</c:if>
				<c:if test="${ i.grade == 3 }">�ڡڡڡ١�</c:if>
				<c:if test="${ i.grade == 4 }">�ڡڡڡڡ�</c:if>
				<c:if test="${ i.grade == 5 }">�ڡڡڡڡ�</c:if>
				(�ۼ��� : ${ i.reviewDate })&nbsp;
				<a href="javascript:fncUpdateReview('${ i.tranNo }');">�������</a>
			</td>
		</tr>
		<tr>
			<td colspan="4" bgcolor="D6D7D6" height="1"></td>
		</tr>
		<tr class="ct_list_pop" height="100">
			<td></td>
			<td align="center"><img src = "/images/reviewImg/${ i.fileName }" width="150"/></td>
			<td></td>
			<td align="left" colspan="1">${ i.detail }</td>
		</tr>
		<tr>
			<td colspan="5" bgcolor="D6D7D6" height="1"></td>
		</tr>
		<tr class="ct_list_pop">
			<td colspan="5">
			<a href="/product/getProduct?prodNo=${ i.prod.prodNo }">${ i.prod.prodName }</a>
			-
			${ i.prod.prodDetail }
			</td>
		</tr>
		<tr>
			<td colspan="5" bgcolor="D6D7D6" height="2"></td>
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
</body>
</html>
