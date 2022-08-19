<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('td.Depth03:contains("����������ȸ")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${ user.userId }");
		})
		$('td.Depth03:contains("ȸ��������ȸ")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
		})
		$('td.Depth03:contains("�ǸŻ�ǰ���")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/addProduct");
		})
		$('td.Depth03:contains("�ǸŻ�ǰ����"), td.Depth03:contains("�� ǰ �� ��")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct");
		})
		$('td.Depth03:contains("�� �� �� ��")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listDelivery");
		})
		$('td.Depth03:contains("�����̷���ȸ")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
		})
		$('td.Depth03:contains("�� �� �� ��")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/cart/listCart");
		})
		$('td.Depth03:contains("���� �� ����")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/review/myReview");
		})
		$('td.Depth03:contains("�ֱ� �� ��ǰ")').bind("click",function(){
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
					����������ȸ
				</td>
			</tr>
		</c:if>
		<c:if test="${ user.role=='admin' }">
			<tr>
				<td class="Depth03" >
					ȸ��������ȸ
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
					�ǸŻ�ǰ���
				</td>
			</tr>
		</c:if>
		
		<tr>
			<td class="Depth03">
					${ user.role=='admin'?'�ǸŻ�ǰ����':'�� ǰ �� ��' }
			</td>
		</tr>
		
		<c:if test="${ user.role=='admin' }">
			<tr>
				<td class="Depth03">
					�� �� �� ��
				</td>
			</tr>
		</c:if>
		
		<c:if test="${ user.role=='user' }">
			<tr>
				<td class="Depth03">
					�����̷���ȸ
				</td>
			</tr>
		</c:if>
		
		
		<c:if test="${ user.role!='admin' }">
			<tr>
				<td class="Depth03">
					�� �� �� ��
				</td>
			</tr>
		</c:if>
		
		
		<c:if test="${ user.role=='user' }">
			<tr>
				<td class="Depth03">
					���� �� ����
				</td>
			</tr>
		</c:if>
			
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
		
		<tr>
			<td class="Depth03">
			�ֱ� �� ��ǰ
			</td>
		</tr>
	</table>
</td>
</tr>

</table>
</body>
</html>