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
	Cookie cookie = new Cookie("name", "green");
	response.addCookie(cookie);
	
	Cookie cookie2 = new Cookie("id", "abc");
	response.addCookie(cookie2);
	
	cookie2.setMaxAge(30);
	
%>
</body>
</html>