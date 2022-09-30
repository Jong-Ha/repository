<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>회원 목록조회</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />

  <div class="container">

    <div class="page-header">
      <h1 class="text-info">회원목록조회</h1>
    </div>



    <div class="row">
      <div class="col-md-6 text-right col-md-offset-6">
        <form class="form-inline" id="detailForm">

          <div class="form-group">
            <select class="form-control" name="searchCondition">
              <option value="0" ${ search.searchCondition == '0'? 'selected' : '' }>회원ID</option>
              <option value="1" ${ search.searchCondition == '1'? 'selected' : '' }>회원명</option>
            </select>
          </div>

          <div class="form-group">
            <label class="sr-only" for="searchKeyword">검색어</label> <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어" value="${ search.searchKeyword }">
          </div>

          <button type="button" class="btn btn-default">검색</button>

          <jsp:include page="../common/pageNavigator.jsp" />
        </form>
      </div>

    </div>



    <table class="table table-hover table-striped">

      <thead>
        <tr>
          <th style="text-align: center;">No</th>
          <th align="left">회원ID</th>
          <th align="left">회원명</th>
          <th align="left">이메일</th>
        </tr>
      </thead>

      <tbody>

        <c:forEach var="i" items="${ list }">
          <tr>
            <td align="center">${ i.rowNum }</td>
            <td align="left" title="Click : 회원정보 확인">${ i.userId }</td>
            <td align="left">${ i.userName }</td>
            <td align="left">${ i.email }</td>
          </tr>
        </c:forEach>

      </tbody>

    </table>

  </div>

</body>
</html>
<script type="text/javascript">
var div = $('<div id="dialog" title="회원 정보"><p></p><div align="right"><input type="button" class="btn btn-default" value="수정"></div></div>');
var check = true;
	function fncCheck(){
		$('#detailForm').attr('action','/user/listUser').attr('method','post');
	}
	$(function(){
		$('td[title]:nth-child(2)').bind('click', function(){
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
					var newRecord = $('<tr>'
							+'<td align="center">'+user.rowNum+'</td>'
							+'<td align="left" title="Click : 회원정보 확인">'+user.userId+'</td>'
							+'<td align="left">'+user.userName+'</td>'
							+'<td align="left">'+nullToStr(user.email)+'</td>'
						+'</tr>');
					$('tbody').append(newRecord);
				})
				$('td[title]:nth-child(2)').unbind('click');
				$('td[title]:nth-child(2)').bind('click', function(){
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
				position:{of:td,my:"right+300 top-15"}
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
				div.find(':button').off();
				div.find(':button').on('click',function(){
					self.location = "/user/updateUser?userId="+userId;
				})
				div.dialog("open");
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
<style type="text/css">
.table>tbody>tr>td {
	padding-top: 50px;
	padding-bottom: 50px;
}
</style>