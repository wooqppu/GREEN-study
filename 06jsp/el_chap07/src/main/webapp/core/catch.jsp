<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자바 코드에서의 예외</h2>

<%
	int num1 = 100;
%>
<c:catch var="eMessage">
	<% 
		int result = num1/0;
	%>
</c:catch> 예외내용 ${eMessage}

</body>
</html>