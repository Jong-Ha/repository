<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>회원 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
var div = $('<div id="dialog" title="회원 정보"><p></p><div align="right"><input type="button" value="수정"></div></div>');
var check = true;
	function fncCheck(){
		$('form').attr('action','/user/listUser').attr('method','post');
	}
	$(function(){
		$('.ct_list_pop td:nth-child(3)').bind('click', function(){
			//self.location = "/user/getUser?userId="+$(this).text().trim();
			var td = $(this);
			dialogInfo(div,td);
		})
	    div.dialog({
	        autoOpen: false
		});
		var nowPage = 1;
		$(window).on('scroll',function(){
			//console.log($(window).scrollTop());
			//console.log($(document).height());
			//console.log($(window).height());
			if($(this).scrollTop() >= $(this).height()-1100){
				//console.log('go!');
				if(check){
					$('#currentPage').val(parseInt($('#currentPage').val())+1);
					loadPage($('#currentPage').val());
				}
			}
		})
	})
	function loadPage(page){
		$.ajax({
			url:"/user/json/listUser",
			method:"POST",
			headers:{
				"Accept":"application/json",
				"Content-Type":"application/json"
			},
			data:JSON.stringify({
				searchCondition:${!empty search.searchCondition?search.searchCondition:0},
				searchKeyword:'${!empty search.searchKeyword?search.searchKeyword:""}',
				currentPage:page
			}),
			dataType:"json",
			success:function(serverData){
				//console.log("ajax 성공");
				if(serverData.list[0]==undefined){
					check = false;
				}
				$.each(serverData.list,function(index,user){
					var newRecord = $('<tr class="ct_list_pop">'
							+'<td align="center" height="150">'+user.rowNum+'</td>'
							+'<td></td>'
							+'<td align="left">'+user.userId+'</td>'
							+'<td></td>'
							+'<td align="left">'+user.userName+'</td>'
							+'<td></td>'
							+'<td align="left">'+nullToStr(user.email)
							+'</td>'		
						+'</tr>'
						+'<tr>'
							+'<td colspan="11" bgcolor="D6D7D6" height="1"></td>'
						+'</tr>');
					$('tr.ct_list_pop').parents('table').append(newRecord);
				})
				$('.ct_list_pop td:nth-child(3)').unbind('click');
				$('.ct_list_pop td:nth-child(3)').bind('click', function(){
					var td = $(this);
					dialogInfo(div,td);
				})
			}
		})
	}
	function dialogInfo(div,td){
		div.dialog('close');
		div.off();
		div.on('dialogopen',function(){
			div.dialog({
				position:{of:td,my:"right top-15"}
			})
		})
		$.ajax({
			url : "/user/json/getUser/"+td.text().trim(),
			headers:{
				"Accept":"application/json",
				"Content-Type":"application/json"
			},
			dataType : "json",
			success : function(user){
				var userId = nullToStr(user.userId);
				var userName = nullToStr(user.userName);
				var addr = nullToStr(user.addr);
				var phone = nullToStr(user.phone);
				var email = nullToStr(user.email);
				var reg = new Date(user.regDate);
				var reg = reg.toISOString().substr(0,10);
				var html = 'userId : '+userId+'<br>userName : '+userName+'<br>address : '+addr+'<br>phone : '+phone+'<br>e-mail : '+email+'<br>RegisterDate : '+reg;
				div.children('p').html(html);
				div.dialog("open");
				div.find(':button').off();
				div.find(':button').on('click',function(){
					self.location = "/user/updateUser?userId="+userId;
				})
				td[0].scrollIntoView({ behavior:'smooth',block: 'center' });
			}
		});
	}
	function nullToStr(str){
		if(str==null){
			return '';
		}else{
			return str;
		}
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">
<%-- <input type="hidden" id="currentPage" name="currentPage" value="${ resultPage.currentPage }"> --%>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">회원 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>

		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${ search.searchCondition == '0'? 'selected' : '' }>회원ID</option>
				<option value="1" ${ search.searchCondition == '1'? 'selected' : '' }>회원명</option>
			</select>
			<input type="text" name="searchKeyword" value="${ search.searchKeyword }" class="ct_input_g" style="width:200px; height:19px" >
		</td>

		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		<%-- 전체  ${ resultPage.totalCount } 건수, 현재 ${ resultPage.currentPage } 페이지 --%>
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">이메일</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:forEach var="i" items="${ list }">
		<tr class="ct_list_pop">
			<td align="center" height=150>${ i.rowNum }</td>
			<td></td>
			<td align="left">${ i.userId }</td>
			<td></td>
			<td align="left">${ i.userName }</td>
			<td></td>
			<td align="left">${ i.email }
			</td>		
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
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
<!--  페이지 Navigator 끝 -->
</form>
</div>

</body>
</html>