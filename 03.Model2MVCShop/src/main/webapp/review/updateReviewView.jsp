<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">
function fncUpdateReview(){
	$('form').attr('method','post').attr('action','/review/updateReview?flag=수정').submit();
}
function fncDeleteReview(){
	$('form').attr('method','post').attr('action','/review/deleteReview?flag=삭제').submit();
}
$(function(){
	$('span').text($('#maxImage').val());
	$('.ct_btn01').eq(0).bind('click',function(){
		fncUpdateReview();
	})
	$('.ct_btn01').eq(1).bind('click',function(){
		fncDeleteReview();
	})
	$('.ct_btn01').eq(2).bind('click',function(){
		window.close();
	})
	$('input:button').bind('click',function(){
		var div = $(this).parent();
		var fileName = div.children(':hidden').val();
		$('form').append('<input type="hidden" name="deleteFileList" value="'+fileName+'">');
		$('#maxImage').val(parseInt($('#maxImage').val())+1);
		$('span').text($('#maxImage').val());
		div.remove();
	})
	$('input:file').bind('change',function(){
		if($(this)[0].files.length > $('#maxImage').val()){
			alert('파일 갯수를 초과하였습니다.');
			$(this).val('');
		}
	})
})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" enctype="multipart/form-data" >
<input type="hidden" id="tranNo" name="tranNo" value="${ review.tranNo }">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">리뷰수정</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			평점 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select 	name="grade" class="ct_input_g">
				<option value="1" ${ review.grade==1? 'selected':'' }>★☆☆☆☆</option>
				<option value="2" ${ review.grade==2? 'selected':'' }>★★☆☆☆</option>
				<option value="3" ${ review.grade==3? 'selected':'' }>★★★☆☆</option>
				<option value="4" ${ review.grade==4? 'selected':'' }>★★★★☆</option>
				<option value="5" ${ review.grade==5? 'selected':'' }>★★★★★</option>
			</select>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">상품이미지</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<c:forEach items="${ review.fileList }" var="i">
				<div>
					<img id="existFileName" src = "/images/${ i.path }/${ i.fileName }" height="20"/>
					<input type="hidden" name="existFileName" value="${ i.fileName }">
					<input type="button" value="삭제">
				</div>
			</c:forEach>
			<br>추가등록 (최대 <span>10</span>장)<br>
			<input type="hidden" id="maxImage" value="${ 10 - fn:length(review.fileList) }">
			<input		type="file" name="file" class="ct_input_g" multiple="multiple"
							style="width: 200px; height: 19px" maxLength="13"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			리뷰내용 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="detail" class="ct_input_g" value="${ review.detail }"
						style="width: 500px; height: 100px" maxLength="200" minLength="10"/>
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
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					수정
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					삭제
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
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