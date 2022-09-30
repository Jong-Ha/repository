<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>

<title>상품상세조회</title>
</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />
  <div class="container">
       <div class="page-header">
        <h1 class="text-info">상품상세조회</h1>
      </div>
      
      
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
      <div class="col-xs-8 col-md-4">${ product.prodNo }</div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
      <div class="col-xs-8 col-md-4">${ product.prodName }</div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>평점</strong></div>
      <div class="col-xs-8 col-md-4"><c:if test="${ product.prodGrade != 0 }">
				<c:choose>
					<c:when test="${ product.prodGrade >= 0.0 and product.prodGrade < 0.5 }">☆☆☆☆☆</c:when>
					<c:when test="${ product.prodGrade >= 0.5 and product.prodGrade < 1.5 }">★☆☆☆☆</c:when>
					<c:when test="${ product.prodGrade >= 1.5 and product.prodGrade < 2.5 }">★★☆☆☆</c:when>
					<c:when test="${ product.prodGrade >= 2.5 and product.prodGrade < 3.5 }">★★★☆☆</c:when>
					<c:when test="${ product.prodGrade >= 3.5 and product.prodGrade < 4.5 }">★★★★☆</c:when>
					<c:when test="${ product.prodGrade >= 4.5 and product.prodGrade <= 5.0 }">★★★★★</c:when>
				</c:choose>
				${ product.prodGrade } - <span id="goReview">리뷰보기</span>
			</c:if>
			<c:if test="${ product.prodGrade == 0 }">
				등록된 리뷰가 없습니다.	
			</c:if></div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
      <div class="col-xs-8 col-md-4">
			<c:if test="${ !empty product.mainFile.fileName }"><img src = "/images/${ product.mainFile.path }/${ product.mainFile.fileName }" style="max-width: 300px; max-height: 300px;"/></c:if>
			<c:if test="${ empty product.mainFile.fileName }"><img src = "/images/empty.GIF" style="max-width: 200px; max-height: 200px;"/></c:if>
			<c:if test="${ !empty product.extraFileList }">
				<br/>
				<c:forEach items="${ product.extraFileList }" var="i">
					<img src = "/images/${ i.path }/${ i.fileName }" style="max-width: 150px; max-height: 150px;"/>
				</c:forEach>
			</c:if></div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>상품상세정보</strong></div>
      <div class="col-xs-8 col-md-4">${ product.prodDetail }</div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
      <div class="col-xs-8 col-md-4">${ product.manuDate }</div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>재고</strong></div>
      <div class="col-xs-8 col-md-4">${ product.amount!=0? product.amount : '품절' }</div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>수량</strong></div>
      <div class="col-xs-8 col-md-4">
      
<form id="detailForm">
      <input type="text" id="amount" name="amount" value="1" size="1px"/> 개
<input type="hidden" id="prodNo" name="prodNo" value="${ product.prodNo }">
<input type="hidden" id="productAmount" name="productAmount" value="${ product.amount }">
      </form>
      </div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
      <div class="col-xs-8 col-md-4">${ product.regDate }</div>
    </div>
    
    <hr/>
    
    
    <div class="row">
        <div class="col-md-12 text-center">
        
    <c:if test="${ user.role=='admin' }">
          <button type="button" class="btn btn-primary">확인</button>
          
    </c:if>
    <c:if test="${ user.role!='admin' }">
      <c:if test="${ product.amount!=0 }">
          <button type="button" class="btn btn-primary">장바구니</button>
          
        <c:if test="${ !empty user }">
          <button type="button" class="btn btn-primary">구매</button>
          
        </c:if>
				</c:if>
			</c:if>
        </div>
    </div>
    
    <br/>
    
      
  </div>
<script type="text/javascript">

function fncAddPurchase(){
  if(!fncCheck()){
    alert('수량을 확인해주세요');
    return;
  }
  $('#detailForm').attr('action','/purchase/addPurchaseView').attr('method','post').submit();
}
function fncAddCart(){
  if(!fncCheck()){
    alert('수량을 확인해주세요');
    return;
  }
  $('#detailForm').attr('action','/cart/addCart').attr('method','post').submit();
}
function fncCheck(){
  var amount = parseInt($('#amount').val());
  var productAmount = parseInt($('#productAmount').val());
  if(amount-0<=productAmount-0 && amount-0>0){
    return true;
  }
    return false;
}
$(function(){
  $('#goReview').bind('click',function(){
    self.location = '/review/listReview?prodNo=${ product.prodNo }';
  })
  $('.btn.btn-primary:contains("확인")').bind('click',function(){
    self.location = '/product/listProduct';
  })
  $('.btn.btn-primary:contains("장바구니")').bind('click',function(){
    fncAddCart();
  })
  $('.btn.btn-primary:contains("구매")').bind('click',function(){
    fncAddPurchase();
  })
})
</script>
</body>
</html>