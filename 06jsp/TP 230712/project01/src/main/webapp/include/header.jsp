<%@page import="pmember.PmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style><%@include file="../css/style.css"%></style>
<!--API사용을 위한 자바스크립트 등록-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<header class="inner">
        <div id="head1">
            <div>로고</div>
            <form>
            <ul id="login">
            <% 
            	if(session.getAttribute("UserName") != null) {
			 %>
                <li><a href="/project01/process/logout_process.jsp">로그아웃</a></li>
                <li><a href="/project01/memberview.do?id=${ UserId }">마이페이지</a></li>
            <%
					if(session.getAttribute("UserName").equals("관리자")) {            
            %>
            			<li><a href="/project01/memberlist.jsp">회원목록</a></li>
            			<li>영화 관리</li>
            			<li>드라마 관리</li>
            			<li>음악 관리</li>
            <%
					}
            	} else {
            %>
            	<li><a href="/project01/form/loginForm.jsp">로그인</a></li>
                <li>
                	<a href="/project01/form/joinForm.jsp">회원가입</a>
                </li>
            <%
            	}
            %>
            </ul>
            </form>
        </div>
        <div id="head2">
            <ul id="hmenu">
                <li>영화</li>
                <li>드라마</li>
                <li>음악</li>
            </ul>
            <div>검색</div>
        </div>
    </header>
    <section class="inner">
        <div>