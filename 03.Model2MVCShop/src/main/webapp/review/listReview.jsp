<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>상품 목록조회</title>
</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />

  <div class="container">

    <div class="page-header">
      <h1 class="text-info"><span id="prod">${ product.prodName }</span> 리뷰</h1>
    </div>



    <form class="form-inline" id="detailForm">


      <div class="row">
        <div class="col-md-6 text-right col-md-offset-6">

          <div class="form-group">
            <select name="searchCondition" class="form-control" style="margin-right: 58px;margin-top: 5px;">
				<option value="0" ${ search.searchCondition=='0'?'selected':'' } align="center">최신 리뷰 순</option>
				<option value="1" ${ search.searchCondition=='1'?'selected':'' } align="center">평점 높은 순</option>
				<option value="2" ${ search.searchCondition=='2'?'selected':'' } align="center">평점 낮은 순</option>
            </select>
          </div>

        </div>

      </div>


      <div class="row">전체 ${ resultPage.totalCount } 건수, 현재 ${ search.currentPage } 페이지</div>



      <table class="table table-hover table-striped">


        <tbody>

          <c:forEach var="i" items="${ list }">
            <tr id="${ i.tranNo }">
              <td align="center" rowspan="3" style="width: 200px; height: 200px; text-align: center;"><c:if test="${ !empty i.fileList[0].fileName }">
                  <img src="/images/reviewImg/${ i.fileList[0].fileName }" style="object-fit: contain; width: 100%; height: 100%;" />
                </c:if> <c:if test="${ empty i.fileList[0].fileName }">
                  <img src="/images/empty.GIF" style="object-fit: contain; width: 100%; height: 100%;" />
                </c:if></td>
              <td align="left">
				<c:if test="${ i.grade == 1 }">★☆☆☆☆</c:if>
				<c:if test="${ i.grade == 2 }">★★☆☆☆</c:if>
				<c:if test="${ i.grade == 3 }">★★★☆☆</c:if>
				<c:if test="${ i.grade == 4 }">★★★★☆</c:if>
				<c:if test="${ i.grade == 5 }">★★★★★</c:if>
				(작성일 : ${ i.reviewDate })</td>
            </tr>
            <tr>
              <td align="left">작성자 : ${ i.userId }
              </td>
            </tr>
            <tr>
              <td align="left">${ i.detail }</td>
            </tr>
            <tr>
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
	$('select[name="searchCondition"]').bind('change',function(){
		fncPageNavigator('1');
	})
})
</script>
<script type="text/javascript">
function fncCheck(){
  $('#detailForm').attr('method','post').attr('action','/review/listReview?prodNo=${ product.prodNo }');
}
$(function(){
  $('#prod').bind('click',function(){
    self.location = '/product/getProduct?prodNo=${ product.prodNo }';
  })
})
</script>
</body>
</html>
