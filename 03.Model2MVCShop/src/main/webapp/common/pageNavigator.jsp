<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<input type="hidden" name="currentPage" id="currentPage" value="1">
	
	<script type="text/javascript"> 
	function fncPageNavigator(currentPage) {
		$('#currentPage').val(currentPage);
		fncCheck();
	   	$('#detailForm').submit();
	}
	$(function(){
		$('button.btn.btn-default:contains("°Ë»ö")').bind('click',function(){
			fncPageNavigator('1');
		})
		$('span[name="navi"]').bind('click',function(){
			fncPageNavigator($(this).text().trim());
		})
	})
	</script>