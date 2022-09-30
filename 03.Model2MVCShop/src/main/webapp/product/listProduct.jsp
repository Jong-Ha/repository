<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>상품 목록조회</title>

</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />

  <div class="container">
    <div class="page-header">
      <h1 class="text-info">상품 ${ user.role=='admin' ?'관리':'검색' }</h1>
    </div>





    <form class="form-inline text-right" id="detailForm">

      <input type="hidden" id="prodNo" name="prodNo" value=""> <input type="hidden" id="minPrice" name="minPrice" value=""> <input type="hidden" id="maxPrice" name="maxPrice" value="">


      <div class="form-group">
        <label for="searchKeyword"> <select name="searchCondition" class="form-control">
            <option value="0" ${ search.searchCondition == '0'? 'selected' : '' }>상품명</option>
      <c:if test="${ user.role=='admin' }">
            <option value="1" ${ search.searchCondition == '1'? 'selected' : '' }>상품번호</option>
        </c:if>
        </select>
        </label>
         <input type="text" class="form-control" style="width: 300px;" name="searchKeyword" id="searchKeyword" value="${ search.searchKeyword }" placeholder="검색어 입력">
        <button type="button" class="btn btn-default">검색</button>
      </div>

      <br />
      <div class="form-group" style="padding-right: 58px;">
        가격 검색 <input id="minPriceInput" class="form-control" name="minPriceInput" placeholder="0" value="${ search.minPrice==0 ?'':search.minPrice }" size="4">~<input id="maxPriceInput" name="maxPriceInput" placeholder="∞" class="form-control" value="${ search.maxPrice==0 ?'':search.maxPrice }" size="4"> <select name="prodListCondition" class="form-control">
          <option value="0" ${ search.prodListCondition=='0'?'selected':'' } align="center">신규 상품 순</option>
          <option value="1" ${ search.prodListCondition=='1'?'selected':'' } align="center">높은 가격 순</option>
          <option value="2" ${ search.prodListCondition=='2'?'selected':'' } align="center">낮은 가격 순</option>
          <option value="3" ${ search.prodListCondition=='3'?'selected':'' } align="center">별점 높은 순</option>
          <option value="4" ${ search.prodListCondition=='4'?'selected':'' } align="center">별점 낮은 순</option>
        </select>
        <!-- 정렬순서 변경 끝 -->
      </div>


      <p class="text-right">
        <input type="hidden" id="checkSoldOut" name="checkSoldOut" value="${ search.checkSoldOut }" />
        <c:if test="${ user.role != 'admin' }">
          <span id="soldOut"> <c:choose>
              <c:when test="${ search.checkSoldOut == 'soldOut' }">품절상품 보기</c:when>
              <c:otherwise>품절상품 숨기기</c:otherwise>
            </c:choose>
          </span>
        </c:if>
      </p>

      <jsp:include page="../common/pageNavigator.jsp" />

    </form>
  </div>

  <div class="container">
    <div class="row">
      <c:forEach var="i" items="${ list }">
        <div class="col-sm-6 col-md-4">
          <div class="thumbnail" id="${ i.prodNo }">

            <div class="thumbnail-top">
              <c:if test="${ !empty i.mainFile.fileName }">
                <img src="/images/${ i.mainFile.path }/${ i.mainFile.fileName }" />
              </c:if>
              <c:if test="${ empty i.mainFile.fileName }">
                <img src="/images/empty.GIF" />
              </c:if>
            </div>

            <div class="caption">
              <h3>${ i.prodName }</h3>
              <p>${ i.prodDetail }</p>
              <p align="right">${ i.price }원</p>
              <p align="right">
                <c:if test="${ i.prodGrade != 0 }">
                  <c:choose>
                    <c:when test="${ i.prodGrade >= 0.0 and i.prodGrade < 0.5 }">☆☆☆☆☆</c:when>
                    <c:when test="${ i.prodGrade >= 0.5 and i.prodGrade < 1.5 }">★☆☆☆☆</c:when>
                    <c:when test="${ i.prodGrade >= 1.5 and i.prodGrade < 2.5 }">★★☆☆☆</c:when>
                    <c:when test="${ i.prodGrade >= 2.5 and i.prodGrade < 3.5 }">★★★☆☆</c:when>
                    <c:when test="${ i.prodGrade >= 3.5 and i.prodGrade < 4.5 }">★★★★☆</c:when>
                    <c:when test="${ i.prodGrade >= 4.5 and i.prodGrade <= 5.0 }">★★★★★</c:when>
                  </c:choose>${ i.prodGrade } - <span id="goReview">리뷰보기</span>
                </c:if>
                <c:if test="${ i.prodGrade == 0 }">등록된 리뷰가 없습니다.</c:if>
              </p>
              <p align="right">
                <c:if test="${ user.role!='admin' }">
                <a class="btn btn-primary" role="button" ${ i.amount==0? 'disabled' :'' }>장바구니</a>
                </c:if>
                <a class="btn btn-primary" role="button">상세정보</a>
              </p>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

<script type="text/javascript">
  $(function() {
	  //장바구니 담기
    $('.btn:contains("장바구니")').on(
        'click',
        function() {
          if ($(this).attr('disabled') == 'disabled') {
            alert('품절된 상품입니다.')
            return;
          }
          var button = $(this);
          $.ajax({
            url : "/cart/json/addCart/"
                + button.parents('.thumbnail').attr('id'),
            headers : {
              "Accept" : "application/json",
              "Content-Type" : "application/json"
            },
            success : function() {
              //console.log('ajax success!!')
              alert('장바구니 담기 성공');
            }
          })
        })
        
    $('.btn:contains("상세정보"), .thumbnail-top>img').on(
        'click',
        function() {
          self.location = '/product/getProduct?prodNo='
              + $(this).parents('.thumbnail').attr('id');
        })
        
    $('#goReview').on(
        'click',
        function() {
          self.location = "/review/listReview?prodNo="
              + $(this).parents('.thumbnail').attr('id');
        })
        
    $('select[name="prodListCondition"]').on('change', function() {
      fncPageNavigator('1');
    })
  })
  
  //페이지 이동시 사용
  function fncCheck() {
    $('#detailForm').attr('method', 'post').attr('action',
        '/product/listProduct');
    
    $('#minPrice')
        .val(
            $('#minPriceInput').val() == '' ? 0 : $(
                '#minPriceInput').val());
    $('#maxPrice')
        .val(
            $('#maxPriceInput').val() == '' ? 0 : $(
                '#maxPriceInput').val());
  }
  
  $(function() {
        
    $('#soldOut').on(
        'click',
        function() {
          $('#checkSoldOut').val(
              $('#checkSoldOut').val() == '' ? 'soldOut' : '');
          fncCheck();
          $('#detailForm').submit();
        })

    //검색창 관련
    $('input[name="searchKeyword"]').autocomplete({});
    $('input[name="searchKeyword"]').on('keydown', function(key) {
      if (key.keyCode == 13) {
        fncPageNavigator('1');
      }
    })
    $('input[name="searchKeyword"]').on('keyup', function() {
      var box = $(this);
      if ($('select[name="searchCondition"]').val() == '1') {
        //console.log("상품번호");
        box.autocomplete({
          disabled : true
        })
        return;
      }
      console.log("json/getProductNames/" + box.val());
      if (box.val().length == 0) {
        return;
      }
      $.ajax({
        url : "json/getProductNames/" + box.val(),
        dataType : 'json',
        headers : {
          "Accept" : "application/json",
          "Content-Type" : "application/json"
        },
        success : function(serverData) {
          //console.log('ajax success!!')
          box.autocomplete({
            disabled : false,
            source : serverData
          })
        }
      })
    });

  })
  
  //무한스크롤
  var check = true;
  $(function(){
		var nowPage = 1;
		$(window).on('scroll',function(){
// 			console.log($(window).scrollTop());
// 			console.log($(document).height());
// 			console.log($(window).height());
			if($(this).scrollTop() >= $(document).height()-$(window).height()-300){
// 				console.log('go!');
				if(check){
// 	 				console.log('go!');
// 	 				console.log($('#currentPage').val());
					$('#currentPage').val(parseInt($('#currentPage').val())+1);
					loadPage($('#currentPage').val());
				}
			}
		})
  })
	function loadPage(page){
		$.ajax({
			url:"/product/json/listProduct",
			method:"POST",
			headers:{
				"Accept":"application/json",
				"Content-Type":"application/json"
			},
			data:JSON.stringify({
				searchCondition:${!empty search.searchCondition?search.searchCondition:0},
				searchKeyword:'${!empty search.searchKeyword?search.searchKeyword:""}',
				currentPage:page
			}),
			dataType:"json",
			success:function(serverData){
				//console.log("ajax 성공");
				if(serverData.list[0]==undefined){
					check = false;
				}
				$.each(serverData.list,function(index,i){
					var review;
					if(i.prodGrade!=0){
						if(i.prodGrade >= 0.0 && i.prodGrade < 0.5){review='☆☆☆☆☆'}
						else if(i.prodGrade >= 0.5 && i.prodGrade < 1.5){review='★☆☆☆☆'}
						else if(i.prodGrade >= 1.5 && i.prodGrade < 2.5){review='★★☆☆☆'}
						else if(i.prodGrade >= 2.5 && i.prodGrade < 3.5){review='★★★☆☆'}
						else if(i.prodGrade >= 3.5 && i.prodGrade < 4.5){review='★★★★☆'}
						else if(i.prodGrade >= 4.5 && i.prodGrade <= 5.0){review='★★★★★'}
						review = review+i.prodGrade+' - <span id="goReview">리뷰보기</span>'
					}else if(i.prodGrade==0){
						review = '등록된 리뷰가 없습니다.';
					}
					var imgsrc;
					if(i.mainFile==null){
						imgsrc='empty.GIF';
					}else{
						imgsrc=i.mainFile.path+'/'+i.mainFile.fileName;
					}
					var disabled='';
					if(i.amount==0){
						disabled='disabled';
					}
					var cart='';
					if(${user.role!='admin'}){
						cart = '<a class="btn btn-primary" role="button"'+disabled+'>장바구니</a>'
					}
					var newRecord = $('<div class="col-sm-6 col-md-4">'+
					          '<div class="thumbnail" id="'+
					          i.prodNo+
					          '">'+
					            '<div class="thumbnail-top">'+
					                '<img src="/images/'+
					                imgsrc+
					                '" />'+
					            '</div>'+
					            '<div class="caption">'+
					              '<h3>'+
					              i.prodName+
					              '</h3>'+
					              '<p>'+
					              i.prodDetail+
					              '</p>'+
					              '<p align="right">'+
					              i.price+
					              '원</p>'+
					              '<p align="right">'+
					                review+
					              '</p>'+
					              '<p align="right">'+
					                cart+
					                ' <a class="btn btn-primary" role="button">상세정보</a>'+
					              '</p>'+
					            '</div>'+
					          '</div>'+
					        '</div>');
					$('.thumbnail').parents('.row').append(newRecord);
				})
				$('.btn:contains("상세정보"), .thumbnail-top>img').off('click');
				$('.btn:contains("상세정보"), .thumbnail-top>img').on('click', function(){
			          self.location = '/product/getProduct?prodNo='
			              + $(this).parents('.thumbnail').attr('id');
				})
				$('#goReview').off('click');
				$('#goReview').on('click', function(){
			          self.location = "/review/listReview?prodNo="
			              + $(this).parents('.thumbnail').attr('id');
				})
				$('.btn:contains("장바구니")').off('click');
				$('.btn:contains("장바구니")').on('click', function(){
			          if ($(this).attr('disabled') == 'disabled') {
			              alert('품절된 상품입니다.')
			              return;
			            }
			            var button = $(this);
			            $.ajax({
			              url : "/cart/json/addCart/"
			                  + button.parents('.thumbnail').attr('id'),
			              headers : {
			                "Accept" : "application/json",
			                "Content-Type" : "application/json"
			              },
			              success : function() {
			                //console.log('ajax success!!')
			                alert('장바구니 담기 성공');
			              }
			            })
				})
			}
		})
	}
</script>
</body>
<style type="text/css">
.autoCompleteList {
	z-index: 300;
}

.thumbnail-top {
	text-align: center;
	width: 100%;
	height: 200px;
}

.thumbnail-top>img {
	object-fit: contain;
	width: 100%;
	height: 100%;
}

#goReview {
	cursor: pointer;
}
</style>
</html>
