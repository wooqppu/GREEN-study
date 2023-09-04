<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지입니다.</title>
</head>
<body>
	<div>
		<h1><a href="index.jsp">GREEN</a></h1>
		<ul>
	<%
		Cookie[] cookies = request.getCookies();
		boolean islogin = false;
		if(cookies.length > 0) {
			for(Cookie cookiev : cookies) {
				if(cookiev.getName().equals("username")
						&& cookiev.getValue().equals("admin")) {
					islogin = true;
				}
			}
		}
		// 로그인 되었을 때 - 쿠키의 이름이 username이고 쿠키의 값이 admin일 때  
		if(islogin) {
		%>
		<li><a href="logout_process.jsp">로그아웃</a></li>
		<li>정보수정</li>
		<%
		} 
		// 로그아웃 되었을 때
		else {
		%>
		<li><a href="login.jsp">로그인</a></li>
		<li>회원가입</li>
		<%	
		}
	%>
		</ul>
	</div>
</body>
</html>