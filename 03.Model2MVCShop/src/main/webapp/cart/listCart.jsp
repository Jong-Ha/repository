<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>구매 목록조회</title>

</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />
<div style="width: 98%; margin-left: 10px;">

<form id="detailForm">
<input type="hidden" id="userId" name="userId" value="${ user.userId }"/>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">장바구니 목록</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
<c:if test="${ !empty list }">
	<tr>
		<td align="right" width="15" height="37" colspan="3">
			<span>품절상품 삭제</span>
			<input type="hidden" id="flag" name="flag" value=""/>
		</td>
	</tr>
</c:if>
</table>

<c:if test="${ empty list }">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
		<tr>
			<td align="center" height="50">장바구니에 담긴 상품이 없습니다.</td>
		</tr>
		<tr>
			<td align="center"><input type="button" value="상품보러가기"/></td>
		</tr>
	</table>
</c:if>
<c:if test="${ !empty list }">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
		<tr>
			<td class="ct_list_b" width="50"><input type="checkbox" id="totalBox" name="totalBox"/></td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="300">이미지</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">상품명</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="500">상세정보</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">수량</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" >가격</td>
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
				<tr class="ct_list_pop" height="300" id="${ i.cartNo }">
					<td align="center"><input type="checkbox" id="${ i.cartNo }cartBox" name="cartBox" value="${ i.cartNo }"/></td>
					<td></td>
					<td align="center">
						<c:if test="${ !empty i.prod.mainFile }"><img src = "/images/${ i.prod.mainFile.path }/${ i.prod.mainFile.fileName }" width="200"/></c:if>
						<c:if test="${ empty i.prod.mainFile }"><img src = "/images/empty.GIF" width="200"/></c:if>
					</td>
					<td></td>
					<td align="center">${ i.prod.prodName }</td>
					<td></td>
					<td align="center">${ i.prod.prodDetail }</td>
					<td></td>
					<td align="center">
						<input type="button" value="-">
						<span id="${ i.cartNo }cartAmount">${ i.amount }</span>
						<input type="button" value="+">
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
			<td id="totalPriceView" align="center">총 가격 : ${ totalPrice }원</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" value="구매"/>
				<input type="button" value="삭제"/>
				<input type="hidden" id="totalPrice" name="totalPrice" value=""/>
	    	</td>
		</tr>
	</table>
</c:if>
</form>

</div>

<script type="text/javascript">
function fncAction(action){
  var boxList = document.getElementsByName("cartBox");
  if($('input[name="cartBox"]:checked').size()!=0){
    $('#detailForm').attr('method','post').attr('action','/cart/buyCartView');
    if(action=="삭제"){
      $('#detailForm').attr('action',"/cart/deleteCart");
    }else if($('#userId').val()==""){
      alert("로그인이 필요합니다.");
      //$('#detailForm').attr('action',"/user/login");
      self.location = '/user/login'
      return;
    }
    $('#detailForm').submit();
  }else{
    alert("선택된 상품이 없습니다.")
  }
}
function fncAmount(type,cartNo){
  var amountObj = $('#'+cartNo+'amount');
  var amount = parseInt(amountObj.val());
  var productAmount = parseInt($('#'+cartNo+'productAmount').val());
  if(type=='+'){
    if(amount<productAmount){
      amountObj.val(amount + 1);
    }else{
      alert('더이상 구매하실 수 없습니다.');
    }
  }else if(type=='-'){
    if(amount>1){
      amountObj.val(amount - 1);
    }else{
      alert('최소 구매 수량입니다.');
    }
  }
  var amount = parseInt(amountObj.val());
  var price = parseInt($('#'+cartNo+'price').val());
  $('#'+cartNo+'cartAmount').html(amount);
  $('#'+cartNo+'cartPriceView').html(price+" X "+amount+" = "+(price*amount));
  $('#'+cartNo+'cartPrice').val(price*amount);
  fncTotalPrice();
}
function fncTotalBox(){
  $('input[name="cartBox"]').prop('checked',$('#totalBox').prop('checked'));
  fncTotalPrice();
}
function fncToggleBox(){
  if($('input:checkbox[name="cartBox"]').size()==$('input:checkbox[name="cartBox"]:checked').size()){
    $('#totalBox').prop('checked',true);
  }else{
    $('#totalBox').prop('checked',false);
  }
  fncTotalPrice();
}
function fncTotalPrice(){
  var totalPrice = 0;
  var boxList = $('input[name="cartBox"]').get();
  var cartPriceList = $('input[name="cartPrice"]').get();
  for(i=0; i<boxList.length ;i++){
    if(boxList[i].checked){
      totalPrice += parseInt(cartPriceList[i].value);
    }
  }
  $('#totalPriceView').html("총 가격 : "+totalPrice+"원");
}
function fncDeleteSoldOut(){
  $('input[name="cartBox"]').prop('checked',true);
  $('#flag').val("check");
  $('#detailForm').attr('method','post').attr('action',"/cart/deleteCart").submit();
}
$(function(){
  $('input:checkbox').prop('checked',true);
  $('.ct_list_pop td:nth-child(5)').bind('click',function(){
    self.location = '/product/getProduct?prodNo='+$('#'+$(this).parent().attr('id')+'prodNo').val();
  })
  $('input[value="상품보러가기"]').bind('click',function(){
    self.location = '/product/listProduct';
  })
  $('span:contains("품절상품 삭제")').bind('click',function(){
    fncDeleteSoldOut();
  })
  $('input[name="cartBox"]').bind('click',function(){
    fncToggleBox();
  })
  $('#totalBox').bind('click',function(){
    fncTotalBox();
  })
  $('.ct_list_pop input:button').bind('click',function(){
    fncAmount($(this).val(),$(this).parents('.ct_list_pop').attr('id'));
  })
  $('#totalPriceView').parents('table').find('input:button').bind('click',function(){
    fncAction($(this).val());
  })
})
</script>
</body>
</html>