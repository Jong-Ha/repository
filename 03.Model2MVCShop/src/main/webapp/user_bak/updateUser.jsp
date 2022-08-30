<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>회원정보수정</title>

</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />

<form name="detailForm">

<input type="hidden" name="userId" value="${ vo.userId }">

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">회원정보수정</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			아이디 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${ vo.userId }</td>
					<td>	</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			이름 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="userName" value="${ vo.userName }" class="ct_input_g" 
						style="width:100px; height:19px"  maxLength="50" >
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">주소</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="addr" value="${ vo.addr }" class="ct_input_g" 
							style="width:370px; height:19px"  maxLength="100">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">휴대전화번호</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select 	name="phone1" class="ct_input_g" style="width:50px">
				<option value="010" ${vo.phone1=='010'?'selected':'' }>010</option>
				<option value="011" ${vo.phone1=='011'?'selected':'' }>011</option>
				<option value="016" ${vo.phone1=='016'?'selected':'' }>016</option>
				<option value="018" ${vo.phone1=='018'?'selected':'' }>018</option>
				<option value="019" ${vo.phone1=='019'?'selected':'' }>019</option>
			</select>
			<input type="text" name="phone2" value="${ vo.phone2 }" class="ct_input_g" style="width:100px; height:19px"  maxLength="9" >
			- 
			<input type="text" name="phone3" value="${ vo.phone3 }" class="ct_input_g" style="width:100px; height:19px"  maxLength="9" >
			<input type="hidden" name="phone" class="ct_input_g"  >
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">이메일 </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input 	type="text" name="email" value="${ vo.email }" class="ct_input_g" 
										style="width:100px; height:19px">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						수정
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						취소
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>

<script type="text/javascript">
function fncUpdateUser() {

	var name=$('input[name="userName"]').val();
	
	if(name == null || name.length <1){
		alert("이름은  반드시 입력하셔야 합니다.");
		return;
	}
		
	if($('input[name="phone2"]').val() != "" && $('input[name="phone3"]').val() != "") {
		$('input[name="phone"]').val($('input[name="phone1"]').val() + "-" + $('input[name="phone2"]').val() + "-" + $('input[name="phone3"]').val());
	} else {
		$('input[name="phone"]').val("");
	}
		
	$('form').attr('method','post').attr('action','/user/updateUser').submit();
}

$(function(){
	$('input[name="email"]').bind('focusout',function(){
		var email=$(this).val();
	    if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
	    	alert("이메일 형식이 아닙니다.");
			$(this).val("");
			$(this).focus();
	    }
	})
	
	$('select').bind('change',function(){
		$('input[name="phone2"]').focus();
	})
	
	$('td.ct_btn01').eq(0).bind('click',function(){
		fncUpdateUser();
	})
	$('td.ct_btn01').eq(1).bind('click',function(){
		$('form')[0].reset();
	})
})
</script>