<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>로그인페이지입니다.</h2>
<form action="login_process.jsp" method="post">
	<p>아이디 : <input type="text" name="id" /></p>
	<p>비밀번호 : <input type="password" name="pw" /></p>
	<p><button type="submit">로그인</button></p>
</form>
</body>
</html>