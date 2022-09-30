<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncAddPurchase(){
	if(!fncCheck()){
		alert('������ Ȯ�����ּ���');
		return;
	}
	$('form').attr('action','/purchase/addPurchaseView').attr('method','post').submit();
}
function fncAddCart(){
	if(!fncCheck()){
		alert('������ Ȯ�����ּ���');
		return;
	}
	$('form').attr('action','/cart/addCart').attr('method','post').submit();
}
function fncCheck(){
	var amount = parseInt($('#amount').val());
	var productAmount = parseInt($('#productAmount').val());
	if(amount-0<=productAmount-0 && amount-0>0){
		return true;
	}
		return false;
}
$(function(){
	$('span').bind('click',function(){
		self.location = '/review/listReview?prodNo=${ product.prodNo }';
	})
	$('td.ct_btn01:contains("Ȯ��")').bind('click',function(){
		self.location = '/product/listProduct';
	})
	$('td.ct_btn01:contains("��ٱ���")').bind('click',function(){
		fncAddCart();
	})
	$('td.ct_btn01:contains("����")').bind('click',function(){
		fncAddPurchase();
	})
	$('td.ct_btn01:contains("����")').bind('click',function(){
		history.go(-1);
	})
})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm">
<input type="hidden" id="prodNo" name="prodNo" value="${ product.prodNo }">
<input type="hidden" id="productAmount" name="productAmount" value="${ product.amount }">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${ product.prodNo }</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.prodName }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			���� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<c:if test="${ product.prodGrade != 0 }">
				<c:choose>
					<c:when test="${ product.prodGrade >= 0.0 and product.prodGrade < 0.5 }">�١١١١�</c:when>
					<c:when test="${ product.prodGrade >= 0.5 and product.prodGrade < 1.5 }">�ڡ١١١�</c:when>
					<c:when test="${ product.prodGrade >= 1.5 and product.prodGrade < 2.5 }">�ڡڡ١١�</c:when>
					<c:when test="${ product.prodGrade >= 2.5 and product.prodGrade < 3.5 }">�ڡڡڡ١�</c:when>
					<c:when test="${ product.prodGrade >= 3.5 and product.prodGrade < 4.5 }">�ڡڡڡڡ�</c:when>
					<c:when test="${ product.prodGrade >= 4.5 and product.prodGrade <= 5.0 }">�ڡڡڡڡ�</c:when>
				</c:choose>
				${ product.prodGrade } - <span>���亸��</span>
			</c:if>
			<c:if test="${ product.prodGrade == 0 }">
				��ϵ� ���䰡 �����ϴ�.	
			</c:if>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�̹��� <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<c:if test="${ !empty product.mainFile.fileName }"><img src = "/images/${ product.mainFile.path }/${ product.mainFile.fileName }" style="max-width: 300px; max-height: 300px;"/></c:if>
			<c:if test="${ empty product.mainFile.fileName }"><img src = "/images/empty.GIF" style="max-width: 200px; max-height: 200px;"/></c:if>
			<c:if test="${ !empty product.extraFileList }">
				<br/>
				<c:forEach items="${ product.extraFileList }" var="i">
					<img src = "/images/${ i.path }/${ i.fileName }" style="max-width: 150px; max-height: 150px;"/>
				</c:forEach>
			</c:if>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.prodDetail }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.manuDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.price }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.amount!=0? product.amount : 'ǰ��' }</td>
	</tr>
	
	<c:if test="${ user.role!='admin' && product.amount > 0 }">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">����</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><input type="text" id="amount" name="amount" value="1" size="1px"/> ��</td>
		</tr>
	</c:if>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.regDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">

		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
		<c:if test="${ user.role=='admin' }">
		
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					Ȯ��
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
				<td width="30"></td>
		</c:if>
		<c:if test="${ user.role!='admin' }">
			<c:if test="${ product.amount!=0 }">
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					��ٱ���
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
				<td width="30"></td>
				<c:if test="${ !empty user }">
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
					<td width="30"></td>
				</c:if>
			</c:if>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					����
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
		
		</c:if>
			</tr>
		</table>

		</td>
	</tr>
</table>
</form>

</body>
</html>