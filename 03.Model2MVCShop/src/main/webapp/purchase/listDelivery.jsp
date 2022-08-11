<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncDelivery(tranNo,currentPage){
	document.detailForm.tranNo.value=tranNo;
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.action='/purchase/updateTranCode?tranCode=2';
	document.detailForm.submit();
}
function fncCheck(){}
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

<form name="detailForm" action="/purchase/listDelivery" method="post">
<input type="hidden" id="tranNo" name="tranNo" value="">
<input type="hidden" id="updateBy" name="updateBy" value="admin">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						��� ����
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
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${ search.searchCondition == '0'? 'selected' : '' }>ȸ��ID</option>
				<option value="1" ${ search.searchCondition == '1'? 'selected' : '' }>��ǰ��ȣ</option>
			</select>
			<input type="text" name="searchKeyword" value="${ search.searchKeyword }"
				class="ct_input_g" style="width:200px; height:19px" >
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
		<tr>
			<td colspan="11" height="5"></td>
		</tr>
		<tr>
			<td align="right">
				<select name="tranCondition" class="ct_input_g" onchange="fncPageNavigator('1')">
					<option value="" ${ search.tranCondition=='0'?'selected':'' } align="center">��ۻ�����ȸ</option>
					<option value="4" ${ search.tranCondition=='4'?'selected':'' } align="center">�������</option>
					<option value="1" ${ search.tranCondition=='1'?'selected':'' } align="center">����غ�</option>
					<option value="2" ${ search.tranCondition=='2'?'selected':'' } align="center">�����</option>
					<option value="3" ${ search.tranCondition=='3'?'selected':'' } align="center">��ۿϷ�</option>
				</select>
			</td>
		</tr>
	<!-- ��ۻ��� ��ȸ �� --> 
	
<%-- 	<!-- ���ļ��� ���� -->
	<c:if test="${ user.role != 'admin' }">
		<tr>
			<td colspan="11" height="5" style="margin-right: 15px; float: left;"></td>
		</tr>
		<tr>
			<td class="tdleft" >
				<select name="prodListCondition" class="ct_input_g">
					<option value="0" ${ search.prodListCondition=='0'?'selected':'' } align="center">�ű� ��ǰ ��</option>
					<option value="1" ${ search.prodListCondition=='1'?'selected':'' } align="center">���� ���� ��</option>
					<option value="2" ${ search.prodListCondition=='2'?'selected':'' } align="center">���� ���� ��</option>
				</select>
			</td>
			<td class="tdleft">&nbsp;</td>
			<td align="right" class="tdleft">
				���� �˻� 
				<input id="minPrice" name="minPrice" value="${ search.minPrice==0 ?'':search.minPrice }" size="4">~<input id="maxPrice" name="maxPrice" value="${ search.maxPrice==0 ?'':search.maxPrice }" size="4">
			</td>
		</tr>
	</c:if>
	<!-- ���ļ��� ���� �� --> --%>
	
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="13" >��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ search.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��� ����</td>	
	</tr>
	<tr>
		<td colspan="13" bgcolor="808285" height="1"></td>
	</tr>
	<c:forEach var="i" items="${ list }">
	<tr class="ct_list_pop">
		<td align="center">${ i.rowNum }</td>
		<td></td>
		<td align="left">
			<a href="/purchase/getPurchase?tranNo=${ i.tranNo }">${ i.purchaseProd.prodName }</a>
		</td>
		<td></td>
		<td align="left">${ i.buyer.userId }</td>
		<td></td>
		<td align="left">${ i.orderDate }</td>
		<td></td>
		<td align="left">${ i.divyDate }</td>
		<td></td>
		<td align="left">${ i.amount }</td>
		<td></td>
		<td align="left">
			<c:choose>
				<c:when test="${ i.tranCode==4 }">
					���� ���
				</c:when>
				<c:when test="${ i.tranCode==1 }">
					��� �غ� - 
					<a href="javascript:fncDelivery(${ i.tranNo }, ${ search.currentPage });">����ϱ�</a>
				</c:when>
				<c:when test="${ i.tranCode==2 }">
					�����
				</c:when>
				<c:otherwise>
					��� �Ϸ�
				</c:otherwise>
			</c:choose>
		</td>	
	</tr>
	<tr>
		<td colspan="13" bgcolor="D6D7D6" height="1"></td>
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
