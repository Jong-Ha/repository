<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<input type="hidden" name="currentPage" id="currentPage" value="1">
	
	<%-- <input type='button' value='&lt;&lt;'>
	<c:if test="${ resultPage.beginUnitPage>1 }">
		<input type='button' value='&lt;'>
	</c:if>
	
	<c:forEach var="i" begin="${ resultPage.beginUnitPage }" end="${ resultPage.endUnitPage }">
		<span name="navi">${i}</span>
	</c:forEach>
	
	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
		<input type='button' value='&gt;'>
	</c:if>
	<input type='button' value='&gt;&gt;'> --%>
				

	<script type="text/javascript"> 
	function fncPageNavigator(currentPage) {
		$('#currentPage').val(currentPage);
		fncCheck();
	   	$('form').submit();
	}
	$(function(){
		$('input:button[value="<<"]').bind('click',function(){
			fncPageNavigator('1');
		})
		$('input:button[value="<"]').bind('click',function(){
			fncPageNavigator('${ resultPage.beginUnitPage-1 }');
		})
		$('input:button[value=">"]').bind('click',function(){
			fncPageNavigator('${ resultPage.endUnitPage+1 }');
		})
		$('input:button[value=">>"]').bind('click',function(){
			fncPageNavigator('${ resultPage.maxPage }');
		})
		$('td.ct_btn01').bind('click',function(){
			fncPageNavigator('1');
		})
		$('span[name="navi"]').bind('click',function(){
			fncPageNavigator($(this).text().trim());
		})
	})
	</script>