<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>el 산술연산</h2>
	
<% 
	pageContext.setAttribute("num1", 10);
	pageContext.setAttribute("num2", 6);
%>	

<p>num1 : ${num1}</p>
<p>num2 : ${num2}</p>
<p>num1 + num2 : ${num1 + num2}</p>
<p>num1 - num2 : ${num1 - num2}</p>
<p>num1 * num2 : ${num1 * num2}</p>
<p>num1 / num2 : ${num1 / num2}</p>
<p>num1 div num2 : ${num1 div num2}</p>
<p>num1 % num2 : ${num1 % num2}</p>
<p>num1 mod num2 : ${num1 mod num2}</p>

<h2>param x, y값을 받아서 산술연산</h2>
<p>x + y : ${param.x + param.y}</p>
<p>x - y : ${param.x - param.y}</p>
<p>x * y : ${param.x * param.y}</p>
<p>x / y : ${param.x / param.y}</p>


</body>
</html>