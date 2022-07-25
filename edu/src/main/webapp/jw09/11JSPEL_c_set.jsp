<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="num1" value="100" scope="page"/>
<c:set var="num2"/>

<% 
String abc= (String)pageContext.getAttribute("num2");
System.out.println("_"+abc+"_");
%>

1.num1은 empty : ${empty pageScope.num1} num1= ${pageScope.num1}<br/>
2.num2은 empty : ${empty num2} num2= _${num2}_<br/>
3.num1+num2 : ${num1+pageScope.num2}<br/>
4.c:out을 사용한 num1+num2 : <c:out value="${num1+num2}"/><br/>


<c:set var="num1" scope="page"/>
5.num1 : ${num1} <br/><hr/>

<c:remove var="num1" scope="page"/>
6.num1은 empty : ${empty num1} num1 = _${num1}_<br/>
7.num2은 empty : ${empty num2} num2 = _${pageScope.num2}_

<%
String def = (String)pageContext.getAttribute("num1");
System.out.println("_"+def+"_");
%>


