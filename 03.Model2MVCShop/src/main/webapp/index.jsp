<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Model2 MVC Shop</title>
<meta charset="euc-kr">
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
        </div>
        <div class="item">
        </div>
        <div class="item">
        </div>
        <div class="item">
        </div>
        <div class="item">
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
</div>
</body>

</html>
<script type="text/javascript">
$.ajax({
	url:"/product/json/listProduct",
	method:"post",
	headers:{
		"Accept":"application/json",
		"Content-Type":"application/json"
	},
	data:JSON.stringify({
		pageSize:5
	}),
	dataType:"json",
	success:function(serverData){
		//console.log("ajax 성공");
		$.each(serverData.list,function(index,prod){
			//console.log(index);
			var no;
			switch (index) {
			case 0:
				no='first';
				break;
			case 1:
				no='second';
				break;
			case 2:
				no='third';
				break;
			case 3:
				no='fourth';
				break;
			case 4:
				no='fifth';
				break;
			}
			//console.log(no);
			//console.log($($('.item')[index]).html());
			var item = $('<img class="'+
							no+
							'-slide center-block" src="/images/'+prod.mainFile.path+'/'+prod.mainFile.fileName+'" alt="'+
							no+
							' slide">'+
							'<div class="container">'+
							'<div class="carousel-caption">'+
							'<h1>'+prod.prodName+'</h1>'+
							'<p>'+prod.prodDetail+'</p>'+
							'</div>')
			$($('.item')[index]).html(item);
			$('.carousel-inner>.item>img').css('height','300px');
		})
	}
})
</script>
<style type="text/css">
.carousel-inner>.item>img {
	height:300px;
}
</style>