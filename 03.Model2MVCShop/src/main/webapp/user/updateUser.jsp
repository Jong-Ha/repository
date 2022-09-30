<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>개인정보수정</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />


  <div class="container">
    <div class="page-header text-center">
      <h2 class="text-info">개인정보수정</h2>
    </div>


    <form id="detailForm" class="form-horizontal">


      <div class="form-group">
        <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="userId" name="userId" value="${vo.userId }" placeholder="중복확인하세요" readonly>
        </div>
      </div>

      <div class="form-group">
        <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
        <div class="col-sm-4">
          <input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
        </div>
      </div>

      <div class="form-group">
        <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
        <div class="col-sm-4">
          <input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
          <span id="checkPassword" style="display: none;">비밀번호가 일치하지 않습니다.</span>
        </div>
      </div>

      <div class="form-group">
        <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="userName" name="userName" value="${vo.userName}" placeholder="변경회원이름">
        </div>
      </div>

      <div class="form-group">
        <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="addr" name="addr" value="${vo.addr}" placeholder="변경주소">
        </div>
      </div>

      <div class="form-group">
        <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
        <div class="col-sm-2">
          <select class="form-control" name="phone1" id="phone1">
            <option value="010" ${ ! empty vo.phone1 && vo.phone1 == "010" ? "selected" : ""  }>010</option>
            <option value="011" ${ ! empty vo.phone1 && vo.phone1 == "011" ? "selected" : ""  }>011</option>
            <option value="016" ${ ! empty vo.phone1 && vo.phone1 == "016" ? "selected" : ""  }>016</option>
            <option value="018" ${ ! empty vo.phone1 && vo.phone1 == "018" ? "selected" : ""  }>018</option>
            <option value="019" ${ ! empty vo.phone1 && vo.phone1 == "019" ? "selected" : ""  }>019</option>
          </select>
        </div>
        <div class="col-sm-2">
          <input type="text" class="form-control" id="phone2" name="phone2" value="${ ! empty vo.phone2 ? vo.phone2 : ''}" placeholder="변경번호">
        </div>
        <div class="col-sm-2">
          <input type="text" class="form-control" id="phone3" name="phone3" value="${ ! empty vo.phone3 ? vo.phone3 : ''}" placeholder="변경번호">
        </div>
        <input type="hidden" name="phone" />
      </div>

      <div class="form-group">
        <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="email" name="email" value="${vo.email}" placeholder="변경이메일">
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-offset-4  col-sm-4 text-center">
          <button type="button" class="btn btn-primary">수 &nbsp;정</button>
          <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
        </div>
      </div>

    </form>
  </div>

</body>
</html>

<script type="text/javascript">
	function fncUpdateUser() {

		var name = $('input[name="userName"]').val();

		if (name == null || name.length < 1) {
			alert("이름은  반드시 입력하셔야 합니다.");
			return;
		}
		if($('#checkPassword').css('display')!='none'){
			alert('비밀번호가 일치하지 않습니다.');
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

		$('#detailForm').attr('method', 'post').attr('action', '/user/updateUser')
				.submit();
	}
	function checkPassword(){
		if($('#password').val()!=$('#password2').val()){
			$('#checkPassword').css('display','');
		}else{
			$('#checkPassword').css('display','none');
		}
	}

	$(function() {
		$('#userId').on('click',function(){
			alert('아이디는 수정할 수 없습니다.');
		})
		$('input[name="email"]')
				.bind(
						'focusout',
						function() {
							var email = $(this).val();
							if (email != ""
									&& (email.indexOf('@') < 1 || email
											.indexOf('.') == -1)) {
								alert("이메일 형식이 아닙니다.");
								$(this).val("");
								$(this).focus();
							}
						})
		$('#password').on('change',function(){
			checkPassword();
		})
		$('#password2').on('keyup',function(){
			checkPassword();
		})
		$('select').bind('change', function() {
			$('input[name="phone2"]').focus();
		})

		$('.btn.btn-primary').eq(0).bind('click', function() {
			fncUpdateUser();
		})
		$('.btn.btn-primary').eq(1).bind('click', function() {
			$('#detailForm')[0].reset();
		})
	})
</script>