<html>
<head><title>HelloJSP</title></head>
<body>

<h1>Hello ::  JSP</h1>
<br/>

<% 
	for(int i=0;i<10;i++){
		out.println(" i  : " + i+"<br/>");
	}
%>

<%= "HelloJSP" %>

</body>
</html>
