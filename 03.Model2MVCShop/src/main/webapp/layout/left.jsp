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
		$('p.Depth03:contains("����������ȸ")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${ user.userId }");
		})
		$('p.Depth03:contains("ȸ��������ȸ")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
		})
		$('p.Depth03:contains("�ǸŻ�ǰ���")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/addProduct");
		})
		$('p.Depth03:contains("�ǸŻ�ǰ����"), p.Depth03:contains("�� ǰ �� ��")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct");
		})
		$('p.Depth03:contains("�� �� �� ��")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listDelivery");
		})
		$('p.Depth03:contains("�����̷���ȸ")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
		})
		$('p.Depth03:contains("�� �� �� ��")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/cart/listCart");
		})
		$('p.Depth03:contains("���� �� ����")').bind("click",function(){
			$(window.parent.frames["rightFrame"].document.location).attr("href","/review/myReview");
		})
		$('p.Depth03:contains("�ֱ� �� ��ǰ")').bind("click",function(){
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
				<h1>��������</h1>
				<div>
								<p class="Depth03">
									����������ȸ
								</p>
						
						<c:if test="${ user.role=='admin' }">
								<p class="Depth03" >
									ȸ��������ȸ
								</p>
						</c:if>
				</div>
			</c:if>
					
			<h1>�Ǹ����� ��ǰ</h1>
			<div>
					<c:if test="${ user.role=='admin' }">
							<p class="Depth03">
								�ǸŻ�ǰ���
							</p>
					</c:if>
					
						<p class="Depth03">
								${ user.role=='admin'?'�ǸŻ�ǰ����':'�� ǰ �� ��' }
						</p>
					
					<c:if test="${ user.role!='admin' }">
							<p class="Depth03">
								�� �� �� ��
							</p>
					</c:if>
					
						<p class="Depth03">
						�ֱ� �� ��ǰ
						</p>
			</div>
			
			<c:if test="${ !empty user }">
			<h1>������ ��ǰ</h1>
				<div>
						<c:if test="${ user.role=='admin' }">
								<p class="Depth03">
									�� �� �� ��
								</p>
						</c:if>
						
						<c:if test="${ user.role=='user' }">
								<p class="Depth03">
									�����̷���ȸ
								</p>
						</c:if>
						
						<c:if test="${ user.role=='user' }">
								<p class="Depth03">
									���� �� ����
								</p>
						</c:if>
				</div>
			</c:if>
			
		</td>
	</tr>
</table>
</body>
</html>