<%@page import="util.BoardPage"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 사용자가 입력한 검색 조건을 Map에 저장 
	Map<String, Object> param = new HashMap<>();
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null) {
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	BoardDAO dao = new BoardDAO();
	
	// 전체 게시글 수 확인
	int selectCount = dao.selectCount(param);
	out.println("게시글 수는 : " + selectCount);
	
	// 1페이지 당 보여지는 게시글 수 : 10
	int pageSizes = 10;
	// 블럭 단위 
	int blockpages = 5;
	// 전체 페이지 수 -> 전체 게시글 / 1페이지 당 보여지는 게시글 수 (올림해서 정수로 리턴)
	int totalPages = (int) Math.ceil((double) selectCount/pageSizes);
	// 현재 페이지 
	int pageNum = 1;
	// 페이지 클릭 시 요청하는 값을 받아서 pageTemp에 할당 
	String pageTemp = request.getParameter("pageNum");
	// pageTemp가 null이 아니거나 ""(빈 공백)이 아닐 때 
	// 페이지 문자를 숫자로 변환해서 pageNum에 할당 
	if(pageTemp != null && !pageTemp.equals("")) {
		pageNum = Integer.parseInt(pageTemp);
	}
	
	// 각 페이지마다 출력할 게시물의 범위 설정
	// 1페이지 1~10
	// 2페이지 11~20
	int start = (pageNum-1) * pageSizes + 1;
	int end = pageNum * pageSizes;
	param.put("start", start);
	param.put("end", end);
	
	
	List<BoardDTO> boardlist = dao.getBoardList(param);
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
	<h2>게시글 목록 보기</h2>
	<div>
		<form method="get">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="name">글쓴이</option>
			</select>
			<input type="text" name="searchWord" />
			<input type="submit" value="검색">
		</form>
	</div>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>출판사</td>
			<td>가격</td>
			<td>출판일</td>
		</tr>
		<%
			if(boardlist.isEmpty()) {
				%>
					<tr>
						<td colspan="6">게시글이 없습니다.</td>	
					</tr>
				<%
				
			} else {
				for(BoardDTO dto : boardlist) {
				%>
					<tr>
						<td><%= dto.getNum() %></td>
						<td><a href="boardview.jsp?num=<%= dto.getNum()%>"><%= dto.getTitle() %></a></td>
						<td><%= dto.getName() %></td>
						<td><%= dto.getCompany() %></td>	
						<td><%= dto.getPrice() %></td>
						<td><%= dto.getRegidate() %></td>				
					</tr>
				<%	
				}
			}
		%>
	</table>
	<div>
		<button onclick="location.href='boardwrite.jsp'">글쓰기</button>
	</div>
	<!-- 페이징 처리 -->
	<div>
		<%= BoardPage.pagingStr(selectCount, totalPages, pageSizes, 
				blockpages, pageNum, request.getRequestURI(),
				request.getParameter("searchField"),
				request.getParameter("searchWord")) %>
	</div>
</body>
</html>