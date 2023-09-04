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
		String option = request.getParameter("code");
		String viewURL = null;
		
		if (option.equals("A")) {
			// respnnse.sendRedirect("module/A.jsp")
			viewURL = "module/A.jsp";
		} else if (option.equals("B")) {
			// respnnse.sendRedirect("module/B.jsp")
			viewURL = "module/B.jsp";
		} else {
			// respnnse.sendRedirect("module/C.jsp")
			viewURL = "module/C.jsp";
		}
	%>
	<jsp:forward page="<%= viewURL %>" />
	
</body>
</html>