<%@page import="fileUpload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String idx = request.getParameter("idx");
	MyfileDAO dao = new MyfileDAO();
	int result = dao.myfiledelete(idx);
	dao.close();
	if(result == 1) {
	%>
		<script>
			alert("게시글이 삭제되었습니다.");
			location.replace("filelist.jsp");
		</script>
	<%	
	} else {
		%>
		<script>
			alert("게시글이 삭제되지 않았습니다.");
			location.replace("filelist.jsp");
		</script>
	<%	
		
	}
%>