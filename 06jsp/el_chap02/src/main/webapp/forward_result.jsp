<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	String name = "green";		
	String bloodType = request.getParameter("bloodType");
	%>
	<h2>forward Tag Example</h2>
	<jsp:forward page='<%= bloodType+".jsp" %>'>
		<jsp:param name="name" value="<%= name %>"/>
	</jsp:forward>
</body>
</html>