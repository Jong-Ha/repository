<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<title>상품정보수정</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />


  <div class="container">
    <div class="page-header text-center">
      <h2 class="text-info">상품수정</h2>
    </div>


    <form id="detailForm" class="form-horizontal" enctype="multipart/form-data">


      <div class="form-group">
        <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="prodNo" name="prodNo" value="${ product.prodNo }" readonly>
        </div>
      </div>

      <div class="form-group">
        <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="prodName" name="prodName" value="${ product.prodName }" placeholder="변경상품명">
        </div>
      </div>

      <div class="form-group">
        <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${ product.prodDetail }" placeholder="변경상세정보">
        </div>
      </div>

      <div class="form-group">
        <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="manuDate" name="manuDate" value="${ product.manuDate }" readonly="readonly">
        </div>
      </div>

      <div class="form-group">
        <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="price" name="price" value="${ product.price }" placeholder="변경가격">
        </div>
      </div>

      <div class="form-group">
        <label for="amount" class="col-sm-offset-1 col-sm-3 control-label">수량</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="amount" name="amount" value="${ product.amount }" placeholder="변경수량">
        </div>
      </div>

      <div class="form-group">
        <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
        <div class="col-sm-4">
			<span id="mainFileSpan">
				<c:if test="${ !empty product.mainFile.fileName }">
					<input type="hidden" id="mainFileName" value="${ product.mainFile.fileName }">
					<img id="existMainFileName" src = "/images/${ product.mainFile.path }/${ product.mainFile.fileName }"/>
					<input type="button" value="삭제">
				</c:if>
				<c:if test="${ empty product.mainFile.fileName }">
					<input	type="file" name="file" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13">
				</c:if>
			</span>
        </div>
      </div>

      <div class="form-group">
        <label for="amount" class="col-sm-offset-1 col-sm-3 control-label">수량</label>
        <div class="col-sm-4">

      <c:forEach items="${ product.extraFileList }" var="i">
        <span id="${ i.fileName }">
          <img name="existFileName" src = "/images/${ i.path }/${ i.fileName }" style="max-height: 100px; max-width: 100px;"/>
          <input type="button" value="삭제">
          <br/>
        </span>
      </c:forEach>
      
      <input type="hidden" id="nowExtraFile" value="${ fn:length(product.extraFileList) }">
      <span id="extraImageSpan">
        추가 이미지(최대 ${ 5-fn:length(product.extraFileList) }장)<br/>
      </span>
      <input type="file" name="extraFile" multiple="multiple" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13"/>
      
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

<script type="text/javascript">
function fncAddProduct(){
  //Form 유효성 검증
  var name = $('input[name="prodName"]').val();
  var detail = $('input[name="prodDetail"]').val();
  var manuDate = $('input[name="manuDate"]').val();
  var price = $('input[name="price"]').val();

  if(name == null || name.length<1){
    alert("상품명은 반드시 입력하여야 합니다.");
    return;
  }
  if(detail == null || detail.length<1){
    alert("상품상세정보는 반드시 입력하여야 합니다.");
    return;
  }
  if(manuDate == null || manuDate.length<1){
    alert("제조일자는 반드시 입력하셔야 합니다.");
    return;
  }
  if(price == null || price.length<1){
    alert("가격은 반드시 입력하셔야 합니다.");
    return;
  }
    
  $('#detailForm').attr('method','post').attr('action','/product/updateProduct?').submit();
}
function fncCheckExtraImage(){
  var maxFile = 5 - parseInt($('#nowExtraFile').val());
  if(parseInt($('input[name="extraFile"]')[0].files.length)>parseInt(maxFile)){
    alert('파일 갯수를 초과하였습니다.');
    $('input[name="extraFile"]').val('');
  }
}
function addDeleteList(fileName){
  $('#detailForm').append('<input type="hidden" name="deleteFileList" value="'+fileName+'">');
}
$(function(){
  $('.btn.btn-primary').eq(0).bind('click',function(){
    fncAddProduct();
  })
  $('.btn.btn-primary').eq(1).bind('click',function(){
    $('#detailForm')[0].reset();
  })
  /* $('img[src="../images/ct_icon_date.gif"]').bind('click',function(){
    show_calendar('document.detailForm.manuDate', $('input[name="manuDate"]').val());
  }) */
  $('#mainFileSpan input:button').bind('click',function(){
    var mainFileName = $('#mainFileName').val();
    $(this).parent().html('<input type="file" name="file" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13">');
    addDeleteList(mainFileName);
  })
  $('img[name="existFileName"]').siblings(':button').bind('click',function(){
    var extraFileName = $(this).parent().attr('id');
    $('#nowExtraFile').val($('#nowExtraFile').val()-1);
    addDeleteList(extraFileName);
    $(this).parent().remove();
    var maxFile = 5 - parseInt($('#nowExtraFile').val());
    $('#extraImageSpan').html('추가 이미지(최대 '+maxFile+'장)');
  })
  $('input[name="extraFile"]').bind('change',function(){
    fncCheckExtraImage();
  })
  $('input[name="manuDate"]').datepicker({
        showOn: "button",
        buttonImage: "/images/ct_icon_date.gif",
        buttonImageOnly: true,
        buttonText: "Select date",
        dateFormat: "yy-mm-dd",
        maxDate: 0
      });
})
</script>
</body>
</html>