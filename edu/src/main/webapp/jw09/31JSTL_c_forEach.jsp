<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http//java.sun.com/jsp/jstl/core"%>

<c:forEach var="i"	begin="1" end="10" step="1">

5*${i} = ${5*i}<br/>
</c:forEach><br/><hr/>

<c:forEach var="i" begin="2" end="9" step="2">
${i} 단을 출력합니다.<br/>
<c:forEach var = "j"