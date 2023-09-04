<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	
	
	String sessionid = session.getAttribute("UserName") == null ? 
			"" : session.getAttribute("UserName").toString();
	
	// String sessionid = session.getAttribute("UserId") == null ? 
	//		"" : session.getAttribute("UserId").toString();
	// out.println(sessionid);
	// out.println(dto.getId());
	
	out.println(sessionid);
	out.println(dto.getName());
	
	// 게시글 작성자가 로그인한 아이디인지 확인 혹은 로그인하지 않았을 때 
	if(!sessionid.equals(dto.getName())) {
		%>
			<script>
				alert("게시글을 수정할 수 없습니다.");
				location.replace("boardlist.jsp");
			</script>
		<%
	} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/link.jsp"></jsp:include>
<h2>게시글 수정하기</h2>
<form action="boardedit_process.jsp" method="post">
<table>
	<input type="hidden" name="num" value="<%= dto.getNum() %>" />
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" 
		value="<%=dto.getTitle() %>" /></td>
	</tr>
	<tr>
		<td>출판사</td>
		<td><input type="text" name="company" 
		value="<%=dto.getCompany() %>" /></td>
	</tr>
</table>

<button type="submit">수정하기</button>
<button type="reset">다시입력</button>
<button type="button" onclick="location.href='boardlist.jsp'">목록보기</button>

</form>
</body>
</html>