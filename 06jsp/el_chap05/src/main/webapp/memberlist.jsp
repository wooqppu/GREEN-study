<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> mlist = dao.getMemberList();
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/link.jsp"></jsp:include>
	<h2>회원목록</h2>
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>가입일</td>
		</tr>
		<% 
			// 리스트 항목이 비었는지 확인 
			if(mlist.isEmpty()) {
			%>
				<tr colspan="4">등록된 회원이 없습니다.</tr>	
			<%
			} else {
				for(MemberDTO dto : mlist) {
				%>
					<tr>
						<td><%= dto.getId() %></td>
						<td><%= dto.getPass() %></td>
						<td><%= dto.getName() %></td>
						<td><%= dto.getRegidate() %></td>
					</tr>				
				<%	
				}
			}
		%>
	</table>
</body>
</html>