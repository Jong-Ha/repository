<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style type="text/css">
body {
	padding-top: 50px;
}
.navbar a {
	cursor: pointer;
}
.ui-front {
    z-index: 1030;
}
</style>
<script type="text/javascript">
function searchProd(){
	$('form.navbar-form').attr('method','post').attr('action','/product/listProduct').submit();
}
	$(function() {
		$('.navbar-brand').on('click', function() {
			self.location = '/';
		})
		$('.navbar a:contains("����������ȸ")').bind("click",function() {
			$(self.location).attr("href","/user/getUser?userId=${ user.userId }");
		})
		$('.navbar a:contains("ȸ��������ȸ")').bind("click", function() {
			$(self.location).attr("href", "/user/listUser");
		})
		$('.navbar a:contains("�ǸŻ�ǰ���")').bind("click", function() {
			$(self.location).attr("href", "/product/addProduct");
		})
		$('.navbar a:contains("�ǸŻ�ǰ����"), a:contains("�� ǰ �� ��")').bind("click",function() {
			$(self.location).attr("href", "/product/listProduct");
		})
		$('.navbar a:contains("�� �� �� ��")').bind("click", function() {
			$(self.location).attr("href", "/purchase/listDelivery");
		})
		$('.navbar a:contains("�����̷���ȸ")').bind("click", function() {
			$(self.location).attr("href", "/purchase/listPurchase");
		})
		$('.navbar a:contains("�� �� �� ��")').bind("click", function() {
			$(self.location).attr("href", "/cart/listCart");
		})
		$('.navbar a:contains("���� �� ����")').bind("click", function() {
			$(self.location).attr("href", "/review/myReview");
		})
		$('.navbar a:contains("�α׾ƿ�")').bind("click", function() {
			$(self.location).attr("href", "/user/logout");
		})
		$('.navbar a:contains("ȸ������")').bind("click", function() {
			$(self.location).attr("href", "/user/addUser");
		})
		$('.navbar a:contains("�α���")').bind("click", function() {
			$(self.location).attr("href", "/user/login");
		})
		$('.navbar a:contains("�ֱ� �� ��ǰ")').bind("click",function() {
			popWin = window.open("/product/history","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		})
	})
</script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#toolbar" aria-expanded="false">
					<span class="glyphicon glyphicon-th-large" aria-hidden="true" style="color: white;"></span>
				</button>
				<a class="navbar-brand">MVCShop</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="toolbar">

				<ul class="nav navbar-nav">

					<c:if test="${ !empty user }">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">��������<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a>����������ȸ</a></li>
								<c:if test="${ user.role=='admin' }">
									<li><a>ȸ��������ȸ</a></li>
								</c:if>
							</ul></li>
					</c:if>

					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">�Ǹ����� ��ǰ<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:if test="${ user.role=='admin' }">
								<li><a>�ǸŻ�ǰ���</a></li>
							</c:if>
							<li><a>${ user.role=='admin'?'�ǸŻ�ǰ����':'�� ǰ �� ��' }</a></li>
							<li role="separator" class="divider"></li>
							<c:if test="${ user.role!='admin' }">
								<li><a>�� �� �� ��</a></li>
							</c:if>
							<li><a>�ֱ� �� ��ǰ</a></li>
						</ul></li>

					<c:if test="${ !empty user }">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">������ ��ǰ<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<c:if test="${ user.role=='admin' }">
									<li><a>�� �� �� ��</a></li>
								</c:if>
								<c:if test="${ user.role=='user' }">
									<li><a>�����̷���ȸ</a></li>
									<li><a>���� �� ����</a></li>
								</c:if>
							</ul></li>
					</c:if>

				</ul>

				<ul class="nav navbar-nav navbar-right">
					<c:if test="${ !empty user }">
						<li><a>�α׾ƿ�</a></li>
					</c:if>
					<c:if test="${ empty user }">
						<li><a>ȸ������</a></li>
						<li><a>�α���</a></li>
					</c:if>
				</ul>

				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search" name="searchKeyword">
						<input type="hidden" name="currentPage" value="1">
					</div>
					<button type="button" class="btn btn-default">�˻�</button>
				</form>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
<script type="text/javascript">
$(function(){
    $('.navbar-form input:text').autocomplete({});
	$('li').attr('align', 'center');
	$('.navbar-form button').on('click',function(){
		searchProd();
	})
	$('.navbar-form input').on('keyup',function(){
    	var box = $(this);
    	if(box.val().length==0){
    		return;
    	}
    	$.ajax({
    		url : '/product/json/getProductNames/'+box.val(),
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
	})
	$('.navbar-form input:text').on('keydown',function(key){
		if(key.keyCode==13){
			searchProd();
		}
	})
})
</script>
</body>
</html>