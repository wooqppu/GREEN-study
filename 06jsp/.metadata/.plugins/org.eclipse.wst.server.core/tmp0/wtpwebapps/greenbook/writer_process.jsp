<%@page import="common.GreenBookDAO"%>
<%@page import="common.GreenBookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	
	// 폼에 입력값 받기 
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String company = request.getParameter("company");
	String price = request.getParameter("price");
	String regidate = request.getParameter("regidate");
	
	// DTO 객체 생성 후 DTO 객체에 입력값 설정 
	GreenBookDTO dto = new GreenBookDTO();
	dto.setTitle(title);
	dto.setWriter(writer);
	dto.setCompany(company);
	dto.setPrice(price);
	dto.setRegidate(regidate);
	
		
	// 오라클 연결하고 메소드 호출 
	GreenBookDAO dao = new GreenBookDAO();
	int result = dao.insertBook(dto);
	dao.close();
	
	if(result==1) {
		%>
			<script>
				alert("게시글이 등록되었습니다.");
				location.replace("writer.jsp");
			</script>
		<% 	
	} else {
		%>
			<script>
				alert("게시글 등록에 실패했습니다.");
				location.replace("writer.jsp");
			</script>
		<%
	}
%>
