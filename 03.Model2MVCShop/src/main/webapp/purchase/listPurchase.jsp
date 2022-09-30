<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>���� �����ȸ</title>
</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />

  <div class="container">

    <div class="page-header">
      <h1 class="text-info">���Ÿ����ȸ</h1>
    </div>



    <form class="form-inline" id="detailForm">
      <input type="hidden" id="tranNo" name="tranNo" value=""> <input type="hidden" id="updateBy" name="updateBy" value="user">
      <div class="row">
        <div class="col-md-6 text-right col-md-offset-6">

          <div class="form-group">
            <select name="tranCondition" class="form-control">
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
            <th align="left">�޴»��</th>
            <th align="left">��ǰ��<small>(Ŭ���� ���� Ȯ��)</small></th>
            <th align="left">����</th>
            <th align="left">��������</th>
            <th align="left">��ۻ���</th>
          </tr>
        </thead>

        <tbody>

          <c:forEach var="i" items="${ list }">
            <tr id="${ i.tranNo }">
              <td align="center">${ i.rowNum }</td>
              <td align="left">${ i.receiverName }</td>
              <td align="left" title="Click : �������� Ȯ��">${ i.purchaseProd.prodName }</td>
              <td align="left">${ i.amount }</td>
              <td align="left">${ i.orderDate }</td>
              <td align="left"><c:choose>
                  <c:when test="${ i.tranCode==4 }">���� ���</c:when>
                  <c:when test="${ i.tranCode==1 }">����غ���</c:when>
                  <c:when test="${ i.tranCode==2 }">
              ����� - <span>���ǵ���</span>
                  </c:when>
                  <c:when test="${ i.tranCode==3 }">
              ��ۿϷ�
              <c:if test="${ i.reviewGrade == 0 }">
                - <span>�����ۼ�</span>
                    </c:if>
                  </c:when>
                </c:choose></td>
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
  $('#detailForm').attr('method','post').attr('action','/purchase/updateTranCode?tranCode=3').submit();
}
function fncCheck(){
  $('#detailForm').attr('method','post').attr('action',"/purchase/listPurchase");
}
function fncAddReview(tranNo) {
  popWin = window.open("/review/addReview?tranNo="+tranNo,"popWin", "left=300,top=200,width=800,height=500,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
}
$(function(){
  $('td[title="Click : �������� Ȯ��"]').bind('click',function(){
    self.location = '/purchase/getPurchase?tranNo='+$(this).parent().attr('id');
  })
  $('span:contains("���ǵ���")').bind('click',function(){
    fncDelivery($(this).parents("tr").attr('id'));
  })
  $('span:contains("�����ۼ�")').bind('click',function(){
    fncAddReview($(this).parents("tr").attr('id'));
  })
})
</script>
</body>
</html>