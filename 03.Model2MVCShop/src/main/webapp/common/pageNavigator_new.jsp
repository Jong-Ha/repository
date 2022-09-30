<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<input type="hidden" name="currentPage" id="currentPage" value="1">
<div class="container text-center">
<nav aria-label="Page navigation">
  <ul class="pagination">
    <c:if test="${ resultPage.beginUnitPage>1 }">
      <li><a href="javascript:fncPageNavigator('${ resultPage.beginUnitPage-1 }');" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
    </c:if>
    <c:if test="${ resultPage.beginUnitPage<=1 }">
      <li class="disabled"><a aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
    </c:if>
    <c:forEach var="i" begin="${ resultPage.beginUnitPage }" end="${ resultPage.endUnitPage }">
      <li ${ i==search.currentPage? 'class="active"':'' }><span name="navi">${i}</span></li>
    </c:forEach>
    <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
      <li><a href="javascript:fncPageNavigator('${ resultPage.endUnitPage+1 }');" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
    </c:if>
    <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
      <li class="disabled"><a aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
    </c:if>
  </ul>
</nav>

<nav aria-label="...">
  <ul class="pager">
    <li class="previous"><a><span aria-hidden="true">&larr;</span> First</a></li>
    <li class="next"><a>Last <span aria-hidden="true">&rarr;</span></a></li>
  </ul>
</nav>
</div>
<script type="text/javascript">
	function fncPageNavigator(currentPage) {
		$('#currentPage').val(currentPage);
		fncCheck();
		$('#detailForm').submit();
	}
	$(function() {
		$('a:contains("First")').bind('click', function() {
			fncPageNavigator('1');
		})
		$('a:contains("Last")').bind('click', function() {
			fncPageNavigator('${ resultPage.maxPage }');
		})
		$('button.btn.btn-default:contains("°Ë»ö")').bind('click', function() {
			fncPageNavigator('1');
		})
		$('span[name="navi"]').bind('click', function() {
			fncPageNavigator($(this).text().trim());
		})
	})
</script>
<style type="text/css">
nav[aria-label="Page navigation"] li {
	cursor: pointer;
}
.pager li{
  cursor: pointer;
}
</style>