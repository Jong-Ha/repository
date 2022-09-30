<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />
  <div class="container">
    <div class="page-header">
      <h1 class="text-info">상품등록</h1>
    </div>

    <div class="row">
      <div class="col-xs-4 col-md-2">
        <strong>상품명</strong>
      </div>
      <div class="col-xs-8 col-md-4">${ product.prodName }</div>
    </div>

    <hr />

    <div class="row">
      <div class="col-xs-4 col-md-2">
        <strong>상품이미지</strong>
      </div>
      <div class="col-xs-8 col-md-4">
        <c:if test="${ !empty product.mainFile.fileName }">
          <img src="/images/${ product.mainFile.path }/${ product.mainFile.fileName }" style="max-width: 300px; max-height: 300px;" />
        </c:if>
        <c:if test="${ empty product.mainFile.fileName }">
          <img src="/images/empty.GIF" style="max-width: 200px; max-height: 200px;" />
        </c:if>
        <c:if test="${ !empty product.extraFileList }">
          <br />
          <c:forEach items="${ product.extraFileList }" var="i">
            <img src="/images/${ i.path }/${ i.fileName }" style="max-width: 150px; max-height: 150px;" />
          </c:forEach>
        </c:if>
      </div>
    </div>

    <hr />

    <div class="row">
      <div class="col-xs-4 col-md-2">
        <strong>상품상세정보</strong>
      </div>
      <div class="col-xs-8 col-md-4">${ product.prodDetail }</div>
    </div>

    <hr />

    <div class="row">
      <div class="col-xs-4 col-md-2">
        <strong>제조일자</strong>
      </div>
      <div class="col-xs-8 col-md-4">${ product.manuDate }</div>
    </div>

    <hr />

    <div class="row">
      <div class="col-xs-4 col-md-2">
        <strong>수량</strong>
      </div>
      <div class="col-xs-8 col-md-4">${ product.amount }</div>
    </div>

    <hr />

    <div class="row">
      <div class="col-md-12 text-center">

        <button type="button" class="btn btn-primary">확인</button>

        <button type="button" class="btn btn-primary">추가등록</button>

      </div>
    </div>

    <br />

  </div>
<script type="text/javascript">
  $(function() {
    $('.btn.btn-primary:contains("확인")').bind('click', function() {
      self.location = '/product/listProduct';
    })
    $('.btn.btn-primary:contains("추가등록")').bind('click', function() {
      self.location = '/product/addProduct';
    })
  })
</script>
</body>
</html>
