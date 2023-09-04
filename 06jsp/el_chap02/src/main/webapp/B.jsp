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
		String name = request.getParameter("name");
		String bloodType = request.getParameter("bloodType");
	%>
	<p><%= name %>의 혈액형은</p>
	<p><%= bloodType %>형 이고 규격을 싫어하는 자유로운 타입입니다.</p>
</body>
</html>