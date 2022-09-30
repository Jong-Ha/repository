<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>ȸ������</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />
<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		
    <div class="page-header">
      <h1 class="text-info col-sm-offset-3">ȸ������</h1>
    </div>
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name='detailForm'>
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" readonly>
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info">ID�ߺ�Ȯ��</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
          <span id="checkPassword" class="help-block" style="display: none;">
             <strong class="text-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</strong>
          </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�ֹι�ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="ssn" name="ssn" placeholder="�ֹι�ȣ">
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">" -  " ���� 13�ڸ��Է��ϼ���</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="addr" name="addr" placeholder="�ּ�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
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
		      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="��ȣ">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="��ȣ">
		    </div>
		    <input type="hidden" name="phone"  />
		  </div>
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="�̸���">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>
</html>

<script type="text/javascript">
	function fncAddUser() {
		// Form ��ȿ�� ����
		var id = $('input[name="userId"]').val();
		var pw = $('input[name="password"]').val();
		var pw_confirm = $('input[name="password2"]').val();
		var name = $('input[name="userName"]').val();

		if (id == null || id.length < 1) {
			alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (pw == null || pw.length < 1) {
			alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (pw_confirm == null || pw_confirm.length < 1) {
			alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (name == null || name.length < 1) {
			alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		if (pw != pw_confirm) {
			alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
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
			// ��ȿ�� �ֹι�ȣ ������ ��츸 ���� ��� ����, PortalJuminCheck �Լ��� CommonScript.js �� ���� �ֹι�ȣ üũ �Լ��� 
			if (!PortalJuminCheck(ssn)) {
				alert("�߸��� �ֹι�ȣ�Դϴ�.");
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
				alert("�̸��� ������ �ƴմϴ�.");
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
		var p = $('<p title="���̵� �ߺ� Ȯ��"><input type="text" width="50"> <input type="button" id="idCheck" value="���" disabled="disabled"></p>');
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
				div.html('���̵�� 4���̻� �Է��Ͻʽÿ�');
			}
		});

		$('.btn.btn-info, input[name="userId"]').on("click", function() {
			$('input[name="userId"]').focus();
			p.dialog("open");
		})
		$('input[value="���"]').on('click', function() {
			$('input[name="userId"]').val($(this).siblings(':text').val());
			p.dialog("close");
			$('#password').focus();
		})
		p.find(":text").on('keyup', function() {
			var id = $(this).val();
			if (id.length < 4) {
				div.html('���̵�� 4���̻� �Է��Ͻʽÿ�');
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
						div.html('��밡���� ���̵��Դϴ�.');
						$('input:button').prop('disabled', false);
					} else {
						div.html('�̹� ������� ���̵��Դϴ�.');
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