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
<!-- 변수 선언 -->
<c:set var="scopeVar" value="pageValue" />
<c:set var="scopeVar" value="requestValue" scope="request" />
<c:set var="scopeVar" value="sessionValue" scope="session" />
<c:set var="scopeVar" value="applicationValue" scope="application" />

<h2>출력하기</h2>

<ul>
	<li>페이지 영역 : ${scopeVar}</li>
	<li>리퀘스트 영역 : ${requestScope.scopeVar}</li>
	<li>세션 영역 : ${sessionScope.scopeVar}</li>
	<li>어플리케이션 영역 : ${applicationScope.scopeVar}</li>
</ul>


<h2>session영역 변수 삭제</h2>
<c:remove var="scopeVar" />
<p>리퀘스트 영역 : ${requestScope.scopeVar}</p>
<p>세션 영역 : ${sessionScope.scopeVar}</p>
<p>어플리케이션 영역 : ${applicationScope.scopeVar}</p>

</body>
</html>