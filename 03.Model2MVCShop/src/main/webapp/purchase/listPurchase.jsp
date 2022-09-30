<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>구매 목록조회</title>
</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />

  <div class="container">

    <div class="page-header">
      <h1 class="text-info">구매목록조회</h1>
    </div>



    <form class="form-inline" id="detailForm">
      <input type="hidden" id="tranNo" name="tranNo" value=""> <input type="hidden" id="updateBy" name="updateBy" value="user">
      <div class="row">
        <div class="col-md-6 text-right col-md-offset-6">

          <div class="form-group">
            <select name="tranCondition" class="form-control">
              <option value="" ${ search.tranCondition=='0'?'selected':'' }>배송상태조회</option>
              <option value="4" ${ search.tranCondition=='4'?'selected':'' }>구매취소</option>
              <option value="1" ${ search.tranCondition=='1'?'selected':'' }>배송준비</option>
              <option value="2" ${ search.tranCondition=='2'?'selected':'' }>배송중</option>
              <option value="3" ${ search.tranCondition=='3'?'selected':'' }>배송완료</option>
            </select>
          </div>

        </div>

      </div>



      <table class="table table-hover table-striped">

        <thead>
          <tr>
            <th style="text-align: center;">No</th>
            <th align="left">받는사람</th>
            <th align="left">상품명<small>(클릭시 정보 확인)</small></th>
            <th align="left">수량</th>
            <th align="left">구매일자</th>
            <th align="left">배송상태</th>
          </tr>
        </thead>

        <tbody>

          <c:forEach var="i" items="${ list }">
            <tr id="${ i.tranNo }">
              <td align="center">${ i.rowNum }</td>
              <td align="left">${ i.receiverName }</td>
              <td align="left" title="Click : 구매정보 확인">${ i.purchaseProd.prodName }</td>
              <td align="left">${ i.amount }</td>
              <td align="left">${ i.orderDate }</td>
              <td align="left"><c:choose>
                  <c:when test="${ i.tranCode==4 }">구매 취소</c:when>
                  <c:when test="${ i.tranCode==1 }">배송준비중</c:when>
                  <c:when test="${ i.tranCode==2 }">
              배송중 - <span>물건도착</span>
                  </c:when>
                  <c:when test="${ i.tranCode==3 }">
              배송완료
              <c:if test="${ i.reviewGrade == 0 }">
                - <span>리뷰작성</span>
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
  $('td[title="Click : 구매정보 확인"]').bind('click',function(){
    self.location = '/purchase/getPurchase?tranNo='+$(this).parent().attr('id');
  })
  $('span:contains("물건도착")').bind('click',function(){
    fncDelivery($(this).parents("tr").attr('id'));
  })
  $('span:contains("리뷰작성")').bind('click',function(){
    fncAddReview($(this).parents("tr").attr('id'));
  })
})
</script>
</body>
</html>