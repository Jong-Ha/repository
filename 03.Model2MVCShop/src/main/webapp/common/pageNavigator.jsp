<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<input type="hidden" name="currentPage" id="currentPage" value="1">
	
	<a href="javascript:fncPageNavigator('1');"><input type='button' value='&lt;&lt;'></a>
	<c:if test="${ resultPage.beginUnitPage>1 }">
		<a href="javascript:fncPageNavigator('${ resultPage.beginUnitPage-1 }');"><input type='button' value='&lt;'></a>
	</c:if>
	
	<c:forEach var="i" begin="${ resultPage.beginUnitPage }" end="${ resultPage.endUnitPage }">
		<a href="javascript:fncPageNavigator('${i}');">${i}</a>
	</c:forEach>
	
	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
		<a href="javascript:fncPageNavigator('${ resultPage.endUnitPage+1 }');"><input type='button' value='&gt;'></a>
	</c:if>
	<a href="javascript:fncPageNavigator('${ resultPage.maxPage }');"><input type='button' value='&gt;&gt;'></a>
				

	<script type="text/javascript"> 
	function fncPageNavigator(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}
	</script>