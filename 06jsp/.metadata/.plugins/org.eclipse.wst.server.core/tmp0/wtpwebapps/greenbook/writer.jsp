<%@page import="common.JDBCConnect"%>
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
	JDBCConnect con = new JDBCConnect();
%>

<h2>책 등록 페이지</h2>
	<form name="writeForm" method="post" action="writer_process.jsp">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<td>작가</td>
				<td><input type="text" name="writer" /></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="company" /></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" /></td>
			</tr>
			<tr>
				<td>출판날짜</td>
				<td><input type="text" name="regidate" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">작성완료</button>
					<button type="reset">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>