<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>MVC 패턴으로 회원 인증하기</h2>
	<p>
		<strong>${authMessage}</strong> <br/>
		<a href="./MemberAuth.mvc?id=admin&pass=1234"> 회원인증(관리자) </a>
		<a href="./MemberAuth.mvc?id=green&pass=1234">회원인증(회원) </a>
		<a href="./MemberAuth.mvc?id=stranger&pass=1234"> 회원인증(비회원) </a>
	</p>
</body>
</html>