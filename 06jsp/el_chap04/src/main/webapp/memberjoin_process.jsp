<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");

	// DB 연결 
	JDBCConnect jdbc = new JDBCConnect();
	String sql = "insert into member values(?,?,?,sysdate)";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	psmt.setString(1, id);
	psmt.setString(2, pwd);
	psmt.setString(3, name);
	
	// 쿼리 수행 
	int inResult = psmt.executeUpdate();
	out.println(inResult + "행이 입력되었습니다.");
	
	// 연결 닫기 
	jdbc.close();
	
	response.sendRedirect("selectMember.jsp");
%>