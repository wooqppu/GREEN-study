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
	String id = request.getParameter("memberId");
	if(id != null && id.equals("green")) {
		response.sendRedirect("while_from.jsp");
		// 주소창 뒤에 ?memberId=green 입력하면 while_from.jsp 페이지로 이동하게 됨
	} else {
		%>
		<body>
			잘못된 아이디입니다.
		</body>
		<%
	}
%>
</body>
</html>