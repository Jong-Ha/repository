<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncCheckSoldOut(checkSoldOut){
	document.detailForm.checkSoldOut.value = checkSoldOut;
	fncCheckPrice();
	document.detailForm.submit();
}
function fncCheck(){
	if(document.detailForm.minPriceInput.value==''){
		document.detailForm.minPrice.value=0;
	}else{
		document.detailForm.minPrice.value=document.detailForm.minPriceInput.value;
	}
	if(document.detailForm.maxPriceInput.value==''){
		document.detailForm.maxPrice.value=0;
	}else{
		document.detailForm.maxPrice.value=document.detailForm.maxPriceInput.value;
	}
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

<form name="detailForm" action="/listProduct.do?" method="post">
<input type="hidden" id="prodNo" name="prodNo" value="">
<input type="hidden" id="minPrice" name="minPrice" value="">
<input type="hidden" id="maxPrice" name="maxPrice" value="">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						��ǰ ${ user.role=='admin' ?'����':'�˻�' }
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


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="8" >��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ search.currentPage } ������</td>
		<td colspan="1" align="right" >
			<input type="hidden" id="checkSoldOut" name="checkSoldOut" value="${ search.checkSoldOut }"/>
			<c:if test="${ user.role != 'admin' }">
				<c:choose>
					<c:when test="${ search.checkSoldOut == 'soldOut' }">
						<a href="javascript:fncCheckSoldOut('');">ǰ����ǰ ����</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:fncCheckSoldOut('soldOut');">ǰ����ǰ �����</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="330">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="420">${ user.role=='admin'?'����':'�Ǹ� ����' }</td>	
	</tr>
	<tr>
		<td colspan="9" bgcolor="808285" height="1"></td>
	</tr>
	<c:forEach var="i" items="${ list }">
	<tr class="ct_list_pop">
		<td align="center">${ i.rowNum }</td>
		<td></td>
		<td align="left">
			<a href="/getProduct.do?prodNo=${ i.prodNo }">${ i.prodName }</a>
		</td>
		<td></td>
		<td align="left">${ i.price }</td>
		<td></td>
		<td align="left">${ i.regDate }</td>
		<td></td>
		<td align="left">
			<c:choose>
				<c:when test="${ user.role == 'admin' }">
					${ i.amount }
				</c:when>
				<c:otherwise>
					${ i.amount==0?'ǰ��':'�Ǹ���' }
				</c:otherwise>
			</c:choose>
		</td>	
	</tr>
	<tr>
		<td colspan="9" bgcolor="D6D7D6" height="1"></td>
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
