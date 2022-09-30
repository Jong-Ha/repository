<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
function fncCheck(){
	$('form').attr('method','post').attr('action','/product/listProduct');
	$('#minPrice').val($('#minPriceInput').val()==''?0:$('#minPriceInput').val());
	$('#maxPrice').val($('#maxPriceInput').val()==''?0:$('#maxPriceInput').val());
}
$(function(){
	$('#soldOut').bind('click',function(){
		$('#checkSoldOut').val($('#checkSoldOut').val()==''?'soldOut':'');
		fncCheck();
		$('form').submit();
	})
	$('.ct_list_pop td:nth-child(3)').bind('click',function(){
		self.location = '/product/getProduct?prodNo='+$(this).parent().attr('id');
	})
	$('.ct_list_pop span').bind('click',function(){
		self.location = "/review/listReview?prodNo="+$(this).parent().parent().attr('id');
	})
    $( 'input[name="searchKeyword"]' ).autocomplete({});
    $( 'input[name="searchKeyword"]' ).on('keydown',function(key){
    	if(key.keyCode==13){
			fncPageNavigator('1');
    	}
    })
    $( 'input[name="searchKeyword"]' ).on('keyup',function(){
    	var box = $(this);
    	console.log("json/getProductNames/"+box.val());
    	if(box.val().length==0){
    		return;
    	}
    	$.ajax({
    		dataType : 'json',
    		headers : {
    			"Accept":"application/json",
    			"Content-Type":"application/json"
    		},
    		success : function(serverData){
    			box.autocomplete({
    				source : serverData
    			})
    		}
    	})
    });
	
})
</script>
<style type="text/css">
.tdleft{
	margin-right: 0px; 
	float: right;"
}
.autoCompleteList{
z-index:300;
}
</style>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">
<input type="hidden" id="prodNo" name="prodNo" value="">
<input type="hidden" id="minPrice" name="minPrice" value="">
<input type="hidden" id="maxPrice" name="maxPrice" value="">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						��ǰ ${ user.role=='admin' ?'����':'�˻�' }
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<c:if test="${ user.role == 'admin' }">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
					<option value="0" ${ search.searchCondition == '0'? 'selected' : '' }>��ǰ��</option>
					<option value="1" ${ search.searchCondition == '1'? 'selected' : '' }>��ǰ��ȣ</option>
				</select>
			</c:if>
			
			<input type="text" name="searchKeyword"  class="ct_input_g" 
				style="width:${ user.role=='admin'? '200' : '300'}px; height:19px" value="${ search.searchKeyword }"/>
		</td>
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
<%--   	<!-- ��ۻ��� ��ȸ -->
	<c:if test="${ menu=='manage' }">
		<tr>
			<td colspan="11" height="5"></td>
		</tr>
		<tr>
			<td align="right">
				<select name="tranCondition" class="ct_input_g">
					<option value="0" ${ search.tranCondition=='0'?'selected':'' } align="center">��ۻ�����ȸ</option>
					<option value="1" ${ search.tranCondition=='1'?'selected':'' } align="center">���ſϷ�</option>
					<option value="2" ${ search.tranCondition=='2'?'selected':'' } align="center">�����</option>
					<option value="3" ${ search.tranCondition=='3'?'selected':'' } align="center">��ۿϷ�</option>
				</select>
			</td>
		</tr>
	</c:if>
	<!-- ��ۻ��� ��ȸ �� --> --%>
	
	<!-- ���ļ��� ���� -->
	<tr>
		<td colspan="11" height="5" style="margin-right: 15px; float: left;"></td>
	</tr>
	<tr>
		<td class="tdleft" >
			<select name="prodListCondition" class="ct_input_g">
				<option value="0" ${ search.prodListCondition=='0'?'selected':'' } align="center">�ű� ��ǰ ��</option>
				<option value="1" ${ search.prodListCondition=='1'?'selected':'' } align="center">���� ���� ��</option>
				<option value="2" ${ search.prodListCondition=='2'?'selected':'' } align="center">���� ���� ��</option>
				<option value="3" ${ search.prodListCondition=='3'?'selected':'' } align="center">���� ���� ��</option>
				<option value="4" ${ search.prodListCondition=='4'?'selected':'' } align="center">���� ���� ��</option>
			</select>
		</td>
		<td class="tdleft">&nbsp;</td>
		<td align="right" class="tdleft">
			���� �˻� 
			<input id="minPriceInput" name="minPriceInput" value="${ search.minPrice==0 ?'':search.minPrice }" size="4">~<input id="maxPriceInput" name="maxPriceInput" value="${ search.maxPrice==0 ?'':search.maxPrice }" size="4">
		</td>
	</tr>
	<!-- ���ļ��� ���� �� -->
	
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="12" >��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ search.currentPage } ������</td>
		<td colspan="1" align="right" >
			<input type="hidden" id="checkSoldOut" name="checkSoldOut" value="${ search.checkSoldOut }"/>
			<c:if test="${ user.role != 'admin' }">
			<span id="soldOut">
				<c:choose>
					<c:when test="${ search.checkSoldOut == 'soldOut' }">
						ǰ����ǰ ����
					</c:when>
					<c:otherwise>
						ǰ����ǰ �����
					</c:otherwise>
				</c:choose>
			</span>
			</c:if>
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="300">�̹���</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="300">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="200">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="300">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="200">${ user.role=='admin'?'����':'�Ǹ� ����' }</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">����</td>	
	</tr>
	<tr>
		<td colspan="13" bgcolor="808285" height="1"></td>
	</tr>
	<c:forEach var="i" items="${ list }">
	<tr class="ct_list_pop" height="300" id="${ i.prodNo }">
		<td align="center">${ i.rowNum }</td>
		<td></td>
		<td align="center">
			<c:if test="${ !empty i.mainFile.fileName }"><img src = "/images/${ i.mainFile.path }/${ i.mainFile.fileName }" style="max-width: 200px; max-height: 200px;"/></c:if>
			<c:if test="${ empty i.mainFile.fileName }"><img src = "/images/empty.GIF" style="max-width: 200px; max-height: 200px;"/></c:if>
		</td>
		<td></td>
		<td align="left">
			${ i.prodName }
		</td>
		<td></td>
		<td align="left">${ i.price }</td>
		<td></td>
		<td align="center">${ i.regDate }</td>
		<td></td>
		<td align="center">
			<c:choose>
				<c:when test="${ user.role == 'admin' }">
					${ i.amount }
				</c:when>
				<c:otherwise>
					${ i.amount==0?'ǰ��':'�Ǹ���' }
				</c:otherwise>
			</c:choose>
		</td>	
		<td></td>
		<c:if test="${ i.prodGrade != 0 }">
			<td>
			<c:choose>
				<c:when test="${ i.prodGrade >= 0.0 and i.prodGrade < 0.5 }">�١١١١�</c:when>
				<c:when test="${ i.prodGrade >= 0.5 and i.prodGrade < 1.5 }">�ڡ١١١�</c:when>
				<c:when test="${ i.prodGrade >= 1.5 and i.prodGrade < 2.5 }">�ڡڡ١١�</c:when>
				<c:when test="${ i.prodGrade >= 2.5 and i.prodGrade < 3.5 }">�ڡڡڡ١�</c:when>
				<c:when test="${ i.prodGrade >= 3.5 and i.prodGrade < 4.5 }">�ڡڡڡڡ�</c:when>
				<c:when test="${ i.prodGrade >= 4.5 and i.prodGrade <= 5.0 }">�ڡڡڡڡ�</c:when>
			</c:choose>
			${ i.prodGrade }
			 - <span>���亸��</span>
			 </td>	
		</c:if>
		<c:if test="${ i.prodGrade == 0 }">
			<td>��ϵ� ���䰡 �����ϴ�.</td>	
		</c:if>
	</tr>
	<tr>
		<td colspan="13" bgcolor="D6D7D6" height="1"></td>
	</tr>
		</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">

			<jsp:include page="../common/pageNavigator.jsp"/>
			
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
<script type="text/javascript">
$(function(){
	$('select[name="prodListCondition"]').bind('change',function(){
		fncPageNavigator('1');
	})
})
</script>
</body>
</html>
