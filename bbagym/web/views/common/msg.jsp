<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String script = (String)request.getAttribute("script");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>msg page</title>
</head>
<body>
	<script>
		alert('<%=(String)request.getAttribute("msg")%>'); 
	
		<%=script!=null?script:""%>
	
		location.replace('<%=request.getContextPath()%><%=(String)request.getAttribute("loc")%>');
	</script>
</body>
</html>