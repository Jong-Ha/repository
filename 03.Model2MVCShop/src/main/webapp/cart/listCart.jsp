<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncAction(action){
	var boxList = document.getElementsByName("cartBox");
	var check = false;
	for(i=0; i<boxList.length ;i++){
		if(boxList[i].checked){
			check = true;
			break;
		}
	}
	if(check){
		if(action=="delete"){
			document.detailForm.action="/deleteCart.do";
		}else if(document.getElementById("userId").value==""){
			alert("�α����� �ʿ��մϴ�.");
			document.detailForm.action="/user/loginView.jsp";
		}
		document.detailForm.submit();
	}else{
		alert("���õ� ��ǰ�� �����ϴ�.")
	}
}
function fncAmount(type,cartNo){
	var amountId = cartNo+"amount";
	var priceId = cartNo+"price";
	var productAmountId = cartNo+"productAmount";
	var cartAmountId = cartNo+"cartAmount";
	var cartPriceId = cartNo+"cartPrice";
	var cartPriceViewId = cartNo+"cartPriceView";
	var amount = parseInt(document.getElementById(amountId).value);
	var productAmount = parseInt(document.getElementById(productAmountId).value);
	if(type=='+' && amount<productAmount){
		document.getElementById(amountId).value = amount + 1;
	}else if(type=='-' && amount>1){
		document.getElementById(amountId).value = amount - 1;
	}
	var amount = parseInt(document.getElementById(amountId).value);
	var price = parseInt(document.getElementById(priceId).value);
	document.getElementById(cartAmountId).innerHTML = amount;
	document.getElementById(cartPriceViewId).innerHTML = price+" X "+amount+" = "+(price*amount);
	document.getElementById(cartPriceId).value = price*amount;
	fncTotalPrice();
}
function fncTotalBox(){
	var totalBox = document.getElementById("totalBox");
	var boxList = document.getElementsByName("cartBox");
	for(i=0; i<boxList.length ;i++){
		boxList[i].checked=totalBox.checked;
	}
	fncTotalPrice();
}
function fncToggleBox(){
	var totalBox = document.getElementById("totalBox");
	var boxList = document.getElementsByName("cartBox");
	for(i=0; i<boxList.length ;i++){
		if(!boxList[i].checked){
			totalBox.checked = false;
			fncTotalPrice();
			return;
		}
	}
	totalBox.checked = true;
	fncTotalPrice();
}
function fncTotalPrice(){
	var totalPrice = 0;
	var boxList = document.getElementsByName("cartBox");
	var cartPriceList = document.getElementsByName("cartPrice");
	for(i=0; i<boxList.length ;i++){
		if(boxList[i].checked){
			totalPrice += parseInt(cartPriceList[i].value);
		}
	}
	document.getElementById("totalPriceView").innerHTML = "�� ���� : "+totalPrice+"��";
}
function fncDeleteSoldOut(){
	var boxList = document.getElementsByName("cartBox");
	for(i=0; i<boxList.length ;i++){
		boxList[i].checked=true;
	}
	document.getElementById("flag").value = "check";
	document.detailForm.action="/deleteCart.do";
	document.detailForm.submit();
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/buyCartView.do" method="post">
<input type="hidden" id="userId" name="userId" value="${ user.userId }"/>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ٱ��� ���</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
<c:if test="${ !empty list }">
	<tr>
		<td align="right" width="15" height="37" colspan="3">
			<a href="javascript:fncDeleteSoldOut();">ǰ����ǰ ����</a>
			<input type="hidden" id="flag" name="flag" value=""/>
		</td>
	</tr>
</c:if>
</table>

<c:if test="${ empty list }">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
		<tr>
			<td align="center" height="50">��ٱ��Ͽ� ��� ��ǰ�� �����ϴ�.</td>
		</tr>
		<tr>
			<td align="center"><a href="/listProduct.do"><input type="button" value="��ǰ��������"/></a></td>
		</tr>
	</table>
</c:if>
<c:if test="${ !empty list }">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
		<tr>
			<td class="ct_list_b" width="50"><input type="checkbox" id="totalBox" name="totalBox" onclick="fncTotalBox()" checked/></td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="300">�̹���</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">��ǰ��</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="500">������</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">����</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" >����</td>
		</tr>
		<tr>
			<td colspan="11" bgcolor="808285" height="1"></td>
		</tr>
			<c:forEach var="i" items="${ list }">
				<input type="hidden" id="${ i.cartNo }cartNo" name="${ i.cartNo }cartNo" value="${ i.cartNo }"/>
				<input type="hidden" id="${ i.cartNo }prodNo" name="${ i.cartNo }prodNo" value="${ i.prod.prodNo }"/>
				<input type="hidden" id="${ i.cartNo }amount" name="${ i.cartNo }amount" value="${ i.amount }"/>
				<input type="hidden" id="${ i.cartNo }price" name="${ i.cartNo }price" value="${ i.prod.price }"/>
				<input type="hidden" id="${ i.cartNo }productAmount" name="${ i.cartNo }productAmount" value="${ i.prod.amount }"/>
				<input type="hidden" id="${ i.cartNo }cartPrice" name="cartPrice" value="${ i.prod.price*i.amount }"/>
				<tr class="ct_list_pop">
					<td align="center"><input type="checkbox" id="${ i.cartNo }cartBox" name="cartBox" onclick="fncToggleBox()" checked value="${ i.cartNo }"/></td>
					<td></td>
					<td align="center">${ i.prod.fileName }</td>
					<td></td>
					<td align="center"><a href="/getProduct.do?prodNo=${ i.prod.prodNo }">${ i.prod.prodName }</a></td>
					<td></td>
					<td align="center">${ i.prod.prodDetail }</td>
					<td></td>
					<td align="center">
						<input type="button" onclick="fncAmount('-','${ i.cartNo }')" value="-">
						<span id="${ i.cartNo }cartAmount">${ i.amount }</span>
						<input type="button" onclick="fncAmount('+','${ i.cartNo }')" value="+">
					</td>
					<td></td>
					<td align="center" id="${ i.cartNo }cartPriceView">${ i.prod.price } X ${ i.amount } = ${ i.prod.price*i.amount }</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
			</c:forEach>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td id="totalPriceView" align="center">�� ���� : ${ totalPrice }��</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" value="����" onclick="fncAction('purchase')"/>
				<input type="button" value="����" onclick="fncAction('delete')"/>
				<input type="hidden" id="totalPrice" name="totalPrice" value=""/>
	    	</td>
		</tr>
	</table>
</c:if>
</form>

</div>

</body>
</html>