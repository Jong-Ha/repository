<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>��� ����</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />

  <div class="container">

    <div class="page-header">
      <h1 class="text-info">��� ����</h1>
    </div>



    <form class="form-inline" id="detailForm">
<input type="hidden" id="tranNo" name="tranNo" value="">
<input type="hidden" id="updateBy" name="updateBy" value="admin">



    <div class="row">
      <div class="col-md-6 text-right col-md-offset-6">

          <div class="form-group">
            <select class="form-control" name="searchCondition">
				<option value="0" ${ search.searchCondition == '0'? 'selected' : '' }>ȸ��ID</option>
				<option value="1" ${ search.searchCondition == '1'? 'selected' : '' }>��ǰ��ȣ</option>
            </select>
          </div>

          <div class="form-group">
            <label class="sr-only" for="searchKeyword">�˻���</label> <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="�˻���" value="${ search.searchKeyword }">
          </div>

          <button type="button" class="btn btn-default">�˻�</button>

      </div>

    </div>

      <div class="row">
        <div class="col-md-6 text-right col-md-offset-6">

          <div class="form-group">
            <select name="tranCondition" class="form-control" style="margin-right: 58px;margin-top: 5px;">
              <option value="" ${ search.tranCondition=='0'?'selected':'' }>��ۻ�����ȸ</option>
              <option value="4" ${ search.tranCondition=='4'?'selected':'' }>�������</option>
              <option value="1" ${ search.tranCondition=='1'?'selected':'' }>����غ�</option>
              <option value="2" ${ search.tranCondition=='2'?'selected':'' }>�����</option>
              <option value="3" ${ search.tranCondition=='3'?'selected':'' }>��ۿϷ�</option>
            </select>
          </div>

        </div>

      </div>



      <table class="table table-hover table-striped">

        <thead>
          <tr>
            <th style="text-align: center;">No</th>
            <th align="left">��ǰ��<small>(Ŭ���� ���� Ȯ��)</small></th>
            <th align="left">ȸ��ID</th>
            <th align="left">��������</th>
            <th align="left">����������</th>
            <th align="left">����</th>
            <th align="left">��� ����</th>
          </tr>
        </thead>

        <tbody>

          <c:forEach var="i" items="${ list }">
            <tr id="${ i.tranNo }">
    <td align="center">${ i.rowNum }</td>
    <td align="left">
      ${ i.purchaseProd.prodName }
    </td>
    <td align="left">${ i.buyer.userId }</td>
    <td align="left">${ i.orderDate }</td>
    <td align="left">${ i.divyDate }</td>
    <td align="left">${ i.amount }</td>
    <td align="left">
      <c:choose>
        <c:when test="${ i.tranCode==4 }">
          ���� ���
        </c:when>
        <c:when test="${ i.tranCode==1 }">
          ��� �غ� - 
          <span>����ϱ�</span>
        </c:when>
        <c:when test="${ i.tranCode==2 }">
          �����
        </c:when>
        <c:otherwise>
          ��� �Ϸ�
        </c:otherwise>
      </c:choose>
    </td> 
            </tr>
          </c:forEach>

        </tbody>

      </table>

      <c:import var="pageNavigator" url="../common/pageNavigator_new.jsp" />
      ${ pageNavigator }
    </form>
  </div>
<script type="text/javascript">
$(function(){
	$('select').bind('change',function(){
		fncPageNavigator('1');
	})
})
</script>
<script type="text/javascript">
function fncDelivery(tranNo){
  $('#tranNo').val(tranNo);
  $('#currentPage').val(${ resultPage.currentPage });
  $('#detailForm').attr('method','post').attr('action','/purchase/updateTranCode?tranCode=2').submit();
}
function fncCheck(){
  $('#detailForm').attr('method','post').attr('action',"/purchase/listDelivery");
}
$(function(){
  $('tr[id] td:nth-child(2)').bind('click',function(){
    self.location = '/purchase/getPurchase?tranNo='+$(this).parents('tr').attr('id');
  })
  $('span:contains("����ϱ�")').bind('click',function(){
    fncDelivery($(this).parents("tr").attr('id'));
  })
})
</script>
</body>
</html>
