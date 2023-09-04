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
	
	out.println(sessionid);
	out.println(dto.getName());
	
	// 게시글 작성자가 로그인한 아이디인지 확인 혹은 로그인하지 않았을 때 
	if(!sessionid.equals(dto.getName())) {
		%>
			<script>
				alert("게시글을 삭제할 수 없습니다.");
				location.replace("boardlist.jsp");
			</script>
		<%
	} else {
		int result = dao.deletePost(num);
		if(result == 1) {
			%>
			 <script>
				alert("게시글이 삭제되었습니다.");
				location.replace("boardlist.jsp");
			</script>
			<%
		}
		else {
			%>
			<script>
				alert("게시글을 삭제할 수 없습니다.");
				location.replace("boardlist.jsp");
			<%
		}
		
	}	
%>