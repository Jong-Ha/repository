<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>��ǰ���</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />
  <div class="container">
    <div class="page-header">
      <h1 class="text-info">��ǰ���</h1>
    </div>

    <div class="row">
      <div class="col-xs-4 col-md-2">
        <strong>��ǰ��</strong>
      </div>
      <div class="col-xs-8 col-md-4">${ product.prodName }</div>
    </div>

    <hr />

    <div class="row">
      <div class="col-xs-4 col-md-2">
        <strong>��ǰ�̹���</strong>
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
        <strong>��ǰ������</strong>
      </div>
      <div class="col-xs-8 col-md-4">${ product.prodDetail }</div>
    </div>

    <hr />

    <div class="row">
      <div class="col-xs-4 col-md-2">
        <strong>��������</strong>
      </div>
      <div class="col-xs-8 col-md-4">${ product.manuDate }</div>
    </div>

    <hr />

    <div class="row">
      <div class="col-xs-4 col-md-2">
        <strong>����</strong>
      </div>
      <div class="col-xs-8 col-md-4">${ product.amount }</div>
    </div>

    <hr />

    <div class="row">
      <div class="col-md-12 text-center">

        <button type="button" class="btn btn-primary">Ȯ��</button>

        <button type="button" class="btn btn-primary">�߰����</button>

      </div>
    </div>

    <br />

  </div>
<script type="text/javascript">
  $(function() {
    $('.btn.btn-primary:contains("Ȯ��")').bind('click', function() {
      self.location = '/product/listProduct';
    })
    $('.btn.btn-primary:contains("�߰����")').bind('click', function() {
      self.location = '/product/addProduct';
    })
  })
</script>
</body>
</html>
