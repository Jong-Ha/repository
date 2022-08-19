<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<title>상품정보수정</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">
function fncAddProduct(){
	//Form 유효성 검증
 	var name = $('input[name="prodName"]').val();
	var detail = $('input[name="prodDetail"]').val();
	var manuDate = $('input[name="manuDate"]').val();
	var price = $('input[name="price"]').val();

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
		
	$('form').attr('method','post').attr('action','/product/updateProduct?').submit();
}
function fncCheckExtraImage(){
	var maxFile = 5 - parseInt($('#nowExtraFile').val());
	if(parseInt($('input[name="extraFile"]')[0].files.length)>parseInt(maxFile)){
		alert('파일 갯수를 초과하였습니다.');
		$('input[name="extraFile"]').val('');
	}
}
function addDeleteList(fileName){
	$('form').append('<input type="hidden" name="deleteFileList" value="'+fileName+'">');
}
$(function(){
	$('td.ct_btn01').eq(0).bind('click',function(){
		fncAddProduct();
	})
	$('td.ct_btn01').eq(1).bind('click',function(){
		history.go(-1);
	})
	$('img[src="../images/ct_icon_date.gif"]').bind('click',function(){
		show_calendar('document.detailForm.manuDate', $('input[name="manuDate"]').val());
	})
	$('#mainFileSpan input:button').bind('click',function(){
		var mainFileName = $('#mainFileName').val();
		$(this).parent().html('<input	type="file" name="file" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13">');
		addDeleteList(mainFileName);
	})
	$('img[name="existFileName"]').siblings(':button').bind('click',function(){
		var extraFileName = $(this).parent().attr('id');
		$('#nowExtraFile').val($('#nowExtraFile').val()-1);
		addDeleteList(extraFileName);
		$(this).parent().remove();
		var maxFile = 5 - parseInt($('#nowExtraFile').val());
		$('#extraImageSpan').html('추가 이미지(최대 '+maxFile+'장)');
	})
	$('input[name="extraFile"]').bind('change',function(){
		fncCheckExtraImage();
	})
})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" enctype="multipart/form-data" >

<input type="hidden" name="prodNo" value="${ product.prodNo }"/>

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품수정</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
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
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input 	type="text" name="prodName" class="ct_input_g" 
										style="width: 100px; height: 19px" maxLength="20" value="${ product.prodName }">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품상세정보 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="prodDetail" value="${ product.prodDetail }" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			제조일자 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" readonly="readonly" name="manuDate" value="${ product.manuDate }" 	
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
						<img 	src="../images/ct_icon_date.gif" width="15" height="15"  />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			가격 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="price" value="${ product.price }"
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"/>&nbsp;원
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			수량 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="amount" value="${ product.amount }"
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"/>&nbsp;개
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">상품이미지</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<span id="mainFileSpan">
				<c:if test="${ !empty product.mainFile.fileName }">
					<input type="hidden" id="mainFileName" value="${ product.mainFile.fileName }">
					<img id="existMainFileName" src = "/images/${ product.mainFile.path }/${ product.mainFile.fileName }"/>
					<input type="button" value="삭제">
				</c:if>
				<c:if test="${ empty product.mainFile.fileName }">
					<input	type="file" name="file" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13">
				</c:if>
			</span>
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">추가이미지</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		
			<c:forEach items="${ product.extraFileList }" var="i">
				<span id="${ i.fileName }">
					<img name="existFileName" src = "/images/${ i.path }/${ i.fileName }" style="max-height: 100px; max-width: 100px;"/>
					<input type="button" value="삭제">
					<br/>
				</span>
			</c:forEach>
			
			<input type="hidden" id="nowExtraFile" value="${ fn:length(product.extraFileList) }">
			<span id="extraImageSpan">
				추가 이미지(최대 ${ 5-fn:length(product.extraFileList) }장)<br/>
			</span>
			<input type="file" name="extraFile" multiple="multiple" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13"/>
			
		</td>
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
				
				<c:if test="${ empty product.proTranCode }">
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
						수정
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</c:if>
				
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						취소
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>