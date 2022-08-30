<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>로그인</title>
</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />

  <div class="container" id="main">
    <div class="row">
      <div class="col-md-6">
        <img src="/images/logo-spring.png" width="100%">
      </div>
      <div class="col-md-6">
        <div class="jumbotron">
          <div class="container">
            <form name="detailForm" class="form-horizontal">
              <div class="container">
                <div class="form-group">
                  <label for="userId" class="col-sm-1 control-label"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
                  <div class="col-sm-11">
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="ID">
                  </div>
                </div>
                <div class="form-group">
                  <label for="password" class="col-sm-1 control-label"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></label>
                  <div class="col-sm-11">
                    <input type="password" class="form-control" id="password" name="password" placeholder="password">
                  </div>
                </div>
  <div class="form-group">
    <div class="col-sm-offset-1 col-sm-4">
      <div class="checkbox">
        <label>
          <input type="checkbox" id="keepId" name="keepId"> 아이디 저장
        </label>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="checkbox">
        <label>
          <input type="checkbox" id="keepLogin" name="keepLogin" disabled="disabled"> 자동로그인
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-1 col-sm-11">
      <button type="button" class="btn btn-primary btn-lg" id="login">로그인</button>
    </div>
              </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>

<script type="text/javascript" src="/javascript/jquery.cookie.js"></script>
<script type="text/javascript">
	$('#userId').focus();
</script>

<script type="text/javascript">
	function fncLogin() {
		var id = $('input[name="userId"]').val();
		var pw = $('input[name="password"]').val();
		var keepId = $('#keepId').prop('checked');
		var keepLogin = $('#keepLogin').prop('checked');
// 		console.log('keepId:'+keepId)
// 		console.log('keepLogin:'+keepLogin)
		
		if (id == null || id.length < 1) {
			alert('ID 를 입력하지 않으셨습니다.');
			$('input[name="userId"]').focus();
			return;
		}

		if (pw == null || pw.length < 1) {
			alert('패스워드를 입력하지 않으셨습니다.');
			$('input[name="password"]').focus();
			return;
		}
		//$('form').attr('method','post').attr('action',"/user/login").attr('target',"_parent").submit();
		$.ajax("/user/json/login", {
			method : "post",
			dataType : "json",
			data : JSON.stringify({
				userId : id,
				password : pw
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData) {
				
				console.log(JSONData);
				if(keepId){
					$.cookie('keepId',id,{ expires: 365, path: '/' });
				}else{
					$.removeCookie('keepId',{path:'/'})
				}
				if(keepLogin){
					$.cookie('keepLogin',pw,{ expires: 365, path: '/' });
				}else{
					$.removeCookie('keepLogin',{path:'/'})
				}
				//[방법1]
				$(self.location).attr("href", "/index.jsp");

				//[방법2]
				//window.parent.document.location.reload();

				//[방법3]
				//$(window.parent.frames["topFrame"].document.location).attr("href","/layout/top.jsp");
				//$(window.parent.frames["leftFrame"].document.location).attr("href","/layout/left.jsp");
				//$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId="+JSONData.userId);
			},
			error : function() {
				alert("로그인 실패");
			}
		})
	}
	$(function() {
		$('#userId').focus();
// 		console.log('keepId : '+$.cookie('keepId'))
		if($.cookie('keepId')!=undefined){
			$('#keepId').prop('checked',true);
			$('#keepLogin').prop('disabled',!$('#keepId').prop('checked'));
			$('#userId').val($.cookie('keepId'));
			$('input[name="password"]').focus();
		}
// 		console.log('keepLogin : '+$.cookie('keepLogin'))
		if($.cookie('keepLogin')!=undefined){
			$('#keepLogin').prop('checked',true);
			$('input[name="password"]').val($.cookie('keepLogin'));
		}
		$('#keepId').on('click',function(){
			$('#keepLogin').prop('disabled',!$(this).prop('checked'));
		})
		$('#login').bind('click', function() {
			fncLogin();
		})
		$('input[name="password"]').on('keydown', function(key) {
			if (key.keyCode == 13) {
				fncLogin();
			}
		})
	})
</script>
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}

.jumbotron {
	margin-top: 150;
	background-color: transparent;
}
</style>