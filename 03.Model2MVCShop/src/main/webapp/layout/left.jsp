<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$('p.Depth03:contains("개인정보조회")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${ user.userId }");
		})
		$('p.Depth03:contains("회원정보조회")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
		})
		$('p.Depth03:contains("판매상품등록")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/addProduct");
		})
		$('p.Depth03:contains("판매상품관리"), p.Depth03:contains("상 품 검 색")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct");
		})
		$('p.Depth03:contains("배 송 관 리")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listDelivery");
		})
		$('p.Depth03:contains("구매이력조회")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
		})
		$('p.Depth03:contains("장 바 구 니")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/cart/listCart");
		})
		$('p.Depth03:contains("내가 쓴 리뷰")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/review/myReview");
		})
		$('p.Depth03:contains("최근 본 상품")').bind("click",function(){
			popWin = window.open("/product/history","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		})
		$('td[valign="top"]').accordion({
		      collapsible: true,
		      active : false,
		      heightStyle: "content",
		      event: "click"
	    });
	})
</script>
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

	<tr>
		<td valign="top"> 
		
			<c:if test="${ !empty user }">
				<h1>개인정보</h1>
				<div>
								<p class="Depth03">
									개인정보조회
								</p>
						
						<c:if test="${ user.role=='admin' }">
								<p class="Depth03" >
									회원정보조회
								</p>
						</c:if>
				</div>
			</c:if>
					
			<h1>판매중인 상품</h1>
			<div>
					<c:if test="${ user.role=='admin' }">
							<p class="Depth03">
								판매상품등록
							</p>
					</c:if>
					
						<p class="Depth03">
								${ user.role=='admin'?'판매상품관리':'상 품 검 색' }
						</p>
					
					<c:if test="${ user.role!='admin' }">
							<p class="Depth03">
								장 바 구 니
							</p>
					</c:if>
					
						<p class="Depth03">
						최근 본 상품
						</p>
			</div>
			
			<c:if test="${ !empty user }">
			<h1>구매한 상품</h1>
				<div>
						<c:if test="${ user.role=='admin' }">
								<p class="Depth03">
									배 송 관 리
								</p>
						</c:if>
						
						<c:if test="${ user.role=='user' }">
								<p class="Depth03">
									구매이력조회
								</p>
						</c:if>
						
						<c:if test="${ user.role=='user' }">
								<p class="Depth03">
									내가 쓴 리뷰
								</p>
						</c:if>
				</div>
			</c:if>
			
		</td>
	</tr>
</table>
</body>
</html>