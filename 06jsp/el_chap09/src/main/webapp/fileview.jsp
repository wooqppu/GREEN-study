<%@page import="fileUpload.MyfileDTO"%>
<%@page import="fileUpload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 요청할 때 idx를 받아옴
	String idx = request.getParameter("idx");
	
	// 커넥션 연결
	MyfileDAO dao = new MyfileDAO();
	
	// 게시글 상세조회 메소드 호출해서 DTO타입의 객체 리턴 
	MyfileDTO dto = dao.myfileview(idx);
	pageContext.setAttribute("dto", dto);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상세보기</h2>
	<table>
		<tr>
			<td>번호</td>
			<td>${dto.idx}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${dto.title}</td>
		</tr>
		<tr>
			<td colspan="2"><img src="./uploads/${dto.sfile}"/></td>
			<td>${dto.idx}</td>
		</tr>
		<tr>
			<td colspan="2">
				<form method="post" action="fileedit.jsp">
				<input type="hidden" name="idx" value="${dto.idx}" />
				<button type="submit">수정하기</button>
				</form>
				<form method="post" action="filedelete_process.jsp">
				<input type="hidden" name="idx" value="${dto.idx}" />
				<button type="submit">삭제하기</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>