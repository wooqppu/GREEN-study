<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 수정내용 받기
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String company = request.getParameter("company");

	// DTO 객체에 저장
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setCompany(company);
	
	// 데이터베이스 반영 
	BoardDAO dao = new BoardDAO();
	int result = dao.updateEdit(dto);
	dao.close();
	
	// 성공했을 때
	if(result == 1) {
		response.sendRedirect("boardview.jsp?num=" + dto.getNum());
	}	
	
	// 실패했을 때
	else {
		%>
			<script>
				alert("수정하기가 실패했습니다.")
				location.replace("boardview.jsp?num=<%= dto.getNum()%>");
			</script>
		<% 
	}
	
	
%>
