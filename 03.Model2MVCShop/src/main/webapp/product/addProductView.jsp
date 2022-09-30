<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>��ǰ���</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />
  <!--  ȭ�鱸�� div Start /////////////////////////////////////-->
  <div class="container">


    <div class="page-header">
      <h1 class="text-info col-sm-offset-3">��ǰ���</h1>
    </div>
    <!-- form Start /////////////////////////////////////-->
    <form class="form-horizontal" id='detailForm' enctype="multipart/form-data">

      <div class="form-group">
        <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ��">
        </div>
      </div>

      <div class="form-group">
        <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="������">
        </div>
      </div>

      <div class="form-group">
        <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="manuDate" name="manuDate" readonly="readonly">
        </div>
      </div>

      <div class="form-group">
        <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="price" name="price" placeholder="��ǰ����">
        </div>
      </div>

      <div class="form-group">
        <label for="amount" class="col-sm-offset-1 col-sm-3 control-label">����</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="amount" name="amount" placeholder="��ǰ����">
        </div>
      </div>

      <div class="form-group">
        <label for="file" class="col-sm-offset-1 col-sm-3 control-label">��ǰ �̹���</label>
        <div class="col-sm-4">
          <input type="file" class="form-control" id="file" name="file"> <input type="button" id="addImageBox" value="�̹��� �߰�"> <span id="extraImageView"> </span>
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-offset-4  col-sm-4 text-center">
          <button type="button" class="btn btn-primary">�� &nbsp;��</button>
          <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
        </div>
      </div>
    </form>
    <!-- form Start /////////////////////////////////////-->

  </div>
  <!--  ȭ�鱸�� div end /////////////////////////////////////-->
  <script type="text/javascript">
			var html = '�߰� �̹���(�ִ� 5��)<br/><input type="file" name="extraFile" multiple="multiple" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13"/>';
			function fncAddProduct() {
				//Form ��ȿ�� ����
				var name = $('input[name="prodName"]').val();
				var detail = $('input[name="prodDetail"]').val();
				var manuDate = $('input[name="manuDate"]').val();
				var price = $('input[name="price"]').val();
				var amount = $('input[name="amount"]').val();

				if (name == null || name.length < 1) {
					alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
					return;
				}
				if (detail == null || detail.length < 1) {
					alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
					return;
				}
				if (manuDate == null || manuDate.length < 1) {
					alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
					return;
				}
				if (price == null || price.length < 1) {
					alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
					return;
				}
				if (amount == null || amount.length < 1) {
					alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
					return;
				}

				$('#detailForm').attr('action', '/product/addProduct').attr(
						'method', 'post').submit();
			}

			function fncCheckExtraImage() {
				if (parseInt($('input[name="extraFile"]')[0].files.length) > 5) {
					alert('���� ������ �ʰ��Ͽ����ϴ�.');
					$('input[name="extraFile"]').val('');
				}
			}
			$(function() {
				$('.btn.btn-primary').eq(0).bind('click', function() {
					fncAddProduct();
				})
				$('.btn.btn-primary').eq(1).bind('click', function() {
					$('#detailForm')[0].reset();
				})
				$('#addImageBox').bind('click', function() {
					$('#addImageBox').remove();
					$('#extraImageView').html(html);
					$('input[name="extraFile"]').bind('change', function() {
						fncCheckExtraImage();
					});
				})
				$('input[name="manuDate"]').datepicker({
					showOn : "button",
					buttonImage : "/images/ct_icon_date.gif",
					buttonImageOnly : true,
					buttonText : "Select date",
					dateFormat : "yy-mm-dd",
					maxDate : 0
				});
			})
		</script>
</body>
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>
</html>