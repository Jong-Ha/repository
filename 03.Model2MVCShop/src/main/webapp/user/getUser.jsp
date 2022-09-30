<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>개인정보조회</title>
</head>

<body>

  <jsp:include page="/layout/toolbar.jsp" />
  <div class="container">
       <div class="page-header">
        <h1 class="text-info">개인정보조회</h1>
      </div>
      
      
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
      <div class="col-xs-8 col-md-4">${user.userId}</div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>이 름</strong></div>
      <div class="col-xs-8 col-md-4">${user.userName}</div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>주소</strong></div>
      <div class="col-xs-8 col-md-4">${user.addr}</div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>휴대전화번호</strong></div>
      <div class="col-xs-8 col-md-4">${ !empty user.phone ? user.phone : ''}  </div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>이 메 일</strong></div>
      <div class="col-xs-8 col-md-4">${user.email}</div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>가입일자</strong></div>
      <div class="col-xs-8 col-md-4">${user.regDate}</div>
    </div>
    
    <hr/>
    
    
    <div class="row">
        <div class="col-md-12 text-center">
          <button type="button" class="btn btn-primary">정보수정</button>
        </div>
    </div>
    
    <br/>
    
      
  </div>
</body>
</html>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$('button:contains("정보수정")').bind('click', function() {
			self.location = "/user/updateUser?userId=${ vo.userId }";
		})
	})
</script>