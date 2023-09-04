<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/link.jsp"></jsp:include>
	<%
		if(session.getAttribute("UserName") != null) {
		%>
			<p><%= session.getAttribute("UserName")%>님 로그인되었습니다.
			<a href="logout_process.jsp">로그아웃</a>
			</p>
		<% 
		} else {
		%>
			<p>아직 로그인되지 않았습니다.
			<a href="login.jsp">로그인</a>
			</p>
		<% 
		}
	%>
	<p>사이트에 오신 것을 환영합니다.</p>
</body>
</html>