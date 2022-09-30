<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>회원가입</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />
<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		
    <div class="page-header">
      <h1 class="text-info col-sm-offset-3">회원가입</h1>
    </div>
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name='detailForm'>
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" readonly>
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info">ID중복확인</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
          <span id="checkPassword" class="help-block" style="display: none;">
             <strong class="text-danger">비밀번호가 일치하지 않습니다.</strong>
          </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주민번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="ssn" name="ssn" placeholder="주민번호">
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">" -  " 제외 13자리입력하세요</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="addr" name="addr" placeholder="주소">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phone1" id="phone1">
				  	<option value="010" >010</option>
					<option value="011" >011</option>
					<option value="016" >016</option>
					<option value="018" >018</option>
					<option value="019" >019</option>
				</select>
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="번호">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="번호">
		    </div>
		    <input type="hidden" name="phone"  />
		  </div>
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="이메일">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>
</html>

<script type="text/javascript">
	function fncAddUser() {
		// Form 유효성 검증
		var id = $('input[name="userId"]').val();
		var pw = $('input[name="password"]').val();
		var pw_confirm = $('input[name="password2"]').val();
		var name = $('input[name="userName"]').val();

		if (id == null || id.length < 1) {
			alert("아이디는 반드시 입력하셔야 합니다.");
			return;
		}
		if (pw == null || pw.length < 1) {
			alert("패스워드는  반드시 입력하셔야 합니다.");
			return;
		}
		if (pw_confirm == null || pw_confirm.length < 1) {
			alert("패스워드 확인은  반드시 입력하셔야 합니다.");
			return;
		}
		if (name == null || name.length < 1) {
			alert("이름은  반드시 입력하셔야 합니다.");
			return;
		}

		if (pw != pw_confirm) {
			alert("비밀번호 확인이 일치하지 않습니다.");
			$('input[name="password2"]').focus();
			return;
		}

		if ($('input[name="phone2"]').val() != ""
				&& $('input[name="phone3"]').val() != "") {
			$('input[name="phone"]').val(
					$('select[name="phone1"]').val() + "-"
							+ $('input[name="phone2"]').val() + "-"
							+ $('input[name="phone3"]').val());
		} else {
			$('input[name="phone"]').val("");
		}

		$('form[name="detailForm"]').attr('action', '/user/addUser').attr(
				'method', 'post').submit();
	}

	$(function() {
		$('input[name="ssn"]').bind('change', function() {
			var ssn1, ssn2;
			var nByear, nTyear;
			var today;

			ssn = $('input[name="ssn"]').val();
			// 유효한 주민번호 형식인 경우만 나이 계산 진행, PortalJuminCheck 함수는 CommonScript.js 의 공통 주민번호 체크 함수임 
			if (!PortalJuminCheck(ssn)) {
				alert("잘못된 주민번호입니다.");
				return false;
			}
		})
	})

	function PortalJuminCheck(fieldValue) {
		var pattern = /^([0-9]{6})-?([0-9]{7})$/;
		var num = fieldValue;
		if (!pattern.test(num))
			return false;
		num = RegExp.$1 + RegExp.$2;

		var sum = 0;
		var last = num.charCodeAt(12) - 0x30;
		var bases = "234567892345";
		for (var i = 0; i < 12; i++) {
			if (isNaN(num.substring(i, i + 1)))
				return false;
			sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
		}
		var mod = sum % 11;
		return ((11 - mod) % 10 == last) ? true : false;
	}

	$(function() {
		$('input[name="email"]').bind('focusout',function(){
			var email = $(this).val();
			if (email != ""
					&& (email.indexOf('@') < 1 || email
							.indexOf('.') == -1)) {
				alert("이메일 형식이 아닙니다.");
				$(this).val("");
				$(this).focus();
			}
		})
		$('select').bind('change', function() {
			$('input[name="phone2"]').focus();
		})
		$('.btn.btn-primary').eq(0).bind('click', function() {
			fncAddUser();
		})
		$('.btn.btn-primary').eq(1).bind('click', function() {
			$('form[name="detailForm"]')[0].reset();
		})
		$('#password').on('change',function(){
			if ($(this).val() != $('input[name="password2"]').val()) {
				$('#checkPassword').css('display','');
			} else {
				$('#checkPassword').css('display','none');
			}
		})
		$('input[name="password2"]').bind('keyup', function() {
			if ($(this).val() != $('input[name="password"]').val()) {
				$('#checkPassword').css('display','');
			} else {
				$('#checkPassword').css('display','none');
			}
		})
		var p = $('<p title="아이디 중복 확인"><input type="text" width="50"> <input type="button" id="idCheck" value="사용" disabled="disabled"></p>');
		var div = $('<div style="font-size: 13;"></div>');
		p.dialog({
			autoOpen : false,
			position : {
				of : $('.btn.btn-info'),
				my : "left-400px",
				at : "center"
			},
			appendTo : $('form[name="detailForm"]'),
			close : function() {
				p.find(':text').val('');
			},
			open : function() {
				div.html('아이디는 4자이상 입력하십시오');
			}
		});

		$('.btn.btn-info, input[name="userId"]').on("click", function() {
			$('input[name="userId"]').focus();
			p.dialog("open");
		})
		$('input[value="사용"]').on('click', function() {
			$('input[name="userId"]').val($(this).siblings(':text').val());
			p.dialog("close");
			$('#password').focus();
		})
		p.find(":text").on('keyup', function() {
			var id = $(this).val();
			if (id.length < 4) {
				div.html('아이디는 4자이상 입력하십시오');
				$('input:button').prop('disabled', true);
				return;
			}
			$.ajax({
				url : "/user/json/checkDuplication",
				method : "POST",
				data : JSON.stringify({
					userId : id
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				success : function(map) {
					if (map.result) {
						div.html('사용가능한 아이디입니다.');
						$('input:button').prop('disabled', false);
					} else {
						div.html('이미 사용중인 아이디입니다.');
						$('input:button').prop('disabled', true);
					}
				}
			});//end of ajax
		})
		p.append(div);
		p.find(":text").on('keydown', function(key) {
			if (key.keyCode == 13 && !$('input:button').prop('disabled')) {
				$('input[name="userId"]').val($(this).val());
				p.dialog("close");
				$('#password').focus();
			}
		})
	})
</script>
  <style>
       body > div.container{
          border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>