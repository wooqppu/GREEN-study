<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 내장객체에 속성 추가하기
	pageContext.setAttribute("scopeValue", "페이지 영역");
	// pageContext.setAttribute("페이지스코프", "페이지 영역");
	String pageValue = (String) pageContext.getAttribute("scopeValue");
	request.setAttribute("requestValue", "리퀘스트 영역");
	session.setAttribute("sessionValue", "세션 영역");
	application.setAttribute("applicationValue", "어플리케이션 영역");
	// application.setAttribute("application-Value", "어플리케이션 영역");
	
	pageContext.setAttribute("scopeValue", "페이지스코프");
	request.setAttribute("scopeValue", "리퀘스트스코프");
	session.setAttribute("scopeValue", "세션스코프");
	application.setAttribute("scopeValue", "어플리케이션스코프");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>각 영역에 저장된 속성 읽기</h2>
	<p><%= pageValue %></p>
	
	<ul>
	<!-- 
		객체 표현 방식은 ., [], ", ' 모두 사용 가능 / 영역명 생략 가능 
		${pageScope.scopeValue}
		${pageScope["scopeValue"]}
		${pageScope['scopeValue']}
		조건 - 속성 명에 특수기호나 한글이 있으면 대괄호만 사용할 수 있음
	 -->
	 	 
		<li>페이지 영역 : ${pageScope.scopeValue} </li>
		<!-- <li>페이지 영역 : ${pageScope["페이지스코프"]} </li> 한글 속성 명 -->	
		<li>리퀘스트 영역 : ${requestScope.requestValue} </li>
		<li>세션 영역 : ${sessionScope.sessionValue} </li>
		<!-- <li>세션 영역 : ${sessionValue} </li> 이런 식으로 생략도 가능 -->
		<li>어플리케이션 영역 : ${applicationScope.applicationValue} </li>
		<!-- <li>어플리케이션 영역 : ${applicationScope["application-Value"]} </li> 특수기호 사용 -->
	</ul>
	<p>${scopeValue}</p>
</body>
</html>