<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />
  <!--  화면구성 div Start /////////////////////////////////////-->
  <div class="container">


    <div class="page-header">
      <h1 class="text-info col-sm-offset-3">상품등록</h1>
    </div>
    <!-- form Start /////////////////////////////////////-->
    <form class="form-horizontal" id='detailForm' enctype="multipart/form-data">

      <div class="form-group">
        <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명">
        </div>
      </div>

      <div class="form-group">
        <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상세정보">
        </div>
      </div>

      <div class="form-group">
        <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="manuDate" name="manuDate" readonly="readonly">
        </div>
      </div>

      <div class="form-group">
        <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="price" name="price" placeholder="상품가격">
        </div>
      </div>

      <div class="form-group">
        <label for="amount" class="col-sm-offset-1 col-sm-3 control-label">수량</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="amount" name="amount" placeholder="상품수량">
        </div>
      </div>

      <div class="form-group">
        <label for="file" class="col-sm-offset-1 col-sm-3 control-label">상품 이미지</label>
        <div class="col-sm-4">
          <input type="file" class="form-control" id="file" name="file"> <input type="button" id="addImageBox" value="이미지 추가"> <span id="extraImageView"> </span>
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-offset-4  col-sm-4 text-center">
          <button type="button" class="btn btn-primary">등 &nbsp;록</button>
          <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
        </div>
      </div>
    </form>
    <!-- form Start /////////////////////////////////////-->

  </div>
  <!--  화면구성 div end /////////////////////////////////////-->
  <script type="text/javascript">
			var html = '추가 이미지(최대 5장)<br/><input type="file" name="extraFile" multiple="multiple" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13"/>';
			function fncAddProduct() {
				//Form 유효성 검증
				var name = $('input[name="prodName"]').val();
				var detail = $('input[name="prodDetail"]').val();
				var manuDate = $('input[name="manuDate"]').val();
				var price = $('input[name="price"]').val();
				var amount = $('input[name="amount"]').val();

				if (name == null || name.length < 1) {
					alert("상품명은 반드시 입력하여야 합니다.");
					return;
				}
				if (detail == null || detail.length < 1) {
					alert("상품상세정보는 반드시 입력하여야 합니다.");
					return;
				}
				if (manuDate == null || manuDate.length < 1) {
					alert("제조일자는 반드시 입력하셔야 합니다.");
					return;
				}
				if (price == null || price.length < 1) {
					alert("가격은 반드시 입력하셔야 합니다.");
					return;
				}
				if (amount == null || amount.length < 1) {
					alert("수량은 반드시 입력하여야 합니다.");
					return;
				}

				$('#detailForm').attr('action', '/product/addProduct').attr(
						'method', 'post').submit();
			}

			function fncCheckExtraImage() {
				if (parseInt($('input[name="extraFile"]')[0].files.length) > 5) {
					alert('파일 갯수를 초과하였습니다.');
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