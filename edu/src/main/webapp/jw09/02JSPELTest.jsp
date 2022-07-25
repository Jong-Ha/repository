<%@ page contentType="text/html;charset=euc-kr" %>

<%@ page import="java.util.*" %>

<h3>4. 색인(. , [] ) 연산자 사용</h3><p/>

<%-- 아래내용은 Servlet Controller 가  화면구성 위해 ObjectScope 에 저장 한 것 으로 생각 --%>
<%
	// 1. page ObjectScope 저장
	//pageContext.setAttribute("abc",new String("page ObjectScope 저장된 문자열"));
	// 2. request ObjectScope 저장
	request.setAttribute("abc",new String("request ObjectScope 저장된 문자열"));
	//3.1 session ObjectScope  (size() ==0인)  ArrayList 저장
	session.setAttribute("abc",new ArrayList());
	// 3.2 session ObjectScope 값을 갖는 ArrayList 저장
	ArrayList arrayList =new ArrayList();
	arrayList.add( new String("ArrayList  저장된 문자열") );
	session.setAttribute("def",arrayList);
	// 4. Application ObjectScope 값을 갖는 HashMap 저장
	HashMap hashMap = new HashMap();
	hashMap.put("zzz",new String("HashMap 저장된 문자열"));
	application.setAttribute("abc",hashMap);
%>

	  	  
	  	  
	  	  
	  	  
	  	  
	  	  
	  	  
	  	  
	  	  
	  	  
	  	  
	  	  
	  	  