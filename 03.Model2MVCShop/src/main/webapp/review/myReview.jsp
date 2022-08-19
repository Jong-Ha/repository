<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function fncCheck(){
	$('form').attr('method',"post").attr('action',"/review/myReview");
}
function fncUpdateReview(tranNo){
	popWin = window.open("/review/updateReview?tranNo="+tranNo,"popWin", "left=300,top=200,width=800,height=500,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
}
$(function(){
	$('span:contains("�������")').bind('click',function(){
		fncUpdateReview($(this).parents('.ct_list_pop').attr('id'));
	})
	$('#check').bind('click',function(){
		self.location = '/product/getProduct?prodNo='+$(this).parents('.ct_list_pop').attr('id');
	})
})
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

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="3" >��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ search.currentPage } ������</td>
		<td colspan="1" align="right" ></td>
	</tr>
	<tr>
		<td colspan="1" bgcolor="D6D7D6" height="2" width="300"></td>
		<td colspan="1" bgcolor="D6D7D6" height="2" width="1"></td>
		<td colspan="1" bgcolor="D6D7D6" height="2"></td>
	</tr>
	<c:forEach var="i" items="${ list }">
		<tr class="ct_list_pop" height="300" id="${ i.tranNo }">
			<td align="center" rowspan="5"><img src = "/images/${ i.prod.mainFile.path }/${ i.prod.mainFile.fileName }" width="150"/></td>
			<td></td>
			<td align="left">
				<c:if test="${ i.grade == 1 }">�ڡ١١١�</c:if>
				<c:if test="${ i.grade == 2 }">�ڡڡ١١�</c:if>
				<c:if test="${ i.grade == 3 }">�ڡڡڡ١�</c:if>
				<c:if test="${ i.grade == 4 }">�ڡڡڡڡ�</c:if>
				<c:if test="${ i.grade == 5 }">�ڡڡڡڡ�</c:if>
				(�ۼ��� : ${ i.reviewDate })&nbsp;
				<span>�������</span>
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="D6D7D6" height="1"></td>
		</tr>
		<tr class="ct_list_pop" height="100">
			<td></td>
			<td align="left">
				<table height="100">
					<tr>
						<c:forEach items="${ i.fileList }" var="files">
							<td width="100px" align="center"><img src = "/images/${ files.path }/${ files.fileName }" style="width: 100%;"/></td>
						</c:forEach>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="D6D7D6" height="1"></td>
		</tr>
		<tr class="ct_list_pop" height="100">
			<td></td>
			<td align="left" colspan="1">${ i.detail }</td>
		</tr>
		<tr>
			<td colspan="3" bgcolor="D6D7D6" height="1"></td>
		</tr>
		<tr class="ct_list_pop" id="${ i.prod.prodNo }">
			<td colspan="5">
			<span id="check">${ i.prod.prodName }</span>
			-
			${ i.prod.prodDetail }
			</td>
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
</body>
</html>
