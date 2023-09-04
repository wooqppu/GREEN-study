<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	
	// 폼에 입력값 받기 
	String title = request.getParameter("title");
	String name = session.getAttribute("UserName").toString();
	String company = request.getParameter("company");
	String price = request.getParameter("price");
	
	// DTO 객체 생성 후 DTO 객체에 입력값 설정 
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setName(name);
	dto.setCompany(company);
	dto.setPrice(price);
		
	// 오라클 연결하고 메소드 호출 
	BoardDAO dao = new BoardDAO();
	int result = dao.insertWrite(dto);
	dao.close();
	
	if(result==1) {
		%>
			<script>
				alert("게시글이 등록되었습니다.");
				location.replace("boardlist.jsp");
			</script>
		<% 	
	} else {
		%>
			<script>
				alert("게시글 등록에 실패했습니다.");
				location.replace("boardlist.jsp");
			</script>
		<%
	}
%>
