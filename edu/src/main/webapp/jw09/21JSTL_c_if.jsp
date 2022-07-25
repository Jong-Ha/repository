<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("EUC_KR"); %>

이름 : ${param.name}<br/>

<c:if test="${param.name =='홍길동'}">
홍길동님 환영합니다.<br/>
</c:if>

<c:if test ="${!empty param.name}">
4.${param.name}님 환영합니다.<br/>
</c:if>

<c:set var="level" value="성인" scope="session"/>
<c:if test = "${param.age <19}">
<c:set var="level" value="청소년"/> 

</c:if>

5.${param.name}님은 나이 ${param.age}로 ${level}입니다. <br/>
확인 1 : ${sessionScope.level}<br/>
확인 2 : ${pageScope.level}<br/><hr/>

<c:if test = "${!empty paramValues.sw[0]}">

</c:if>