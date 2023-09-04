<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>절대경로 사용해서 자원 읽기</title>
</head>
<body>
<% 
	// message.txt 파일의 절대경로
	String filepath ="D:\\01-STUDY\\06jsp\\el_chap01\\src\\main\\webapp\\file\\messagee.txt"; 
	char[] buff = new char[128]; // 128자씩 끊어서 읽게하기 위함
	int len = -1;	// 초기값 -1 : 읽을 값이 없다는 뜻 
	
	try{
		// 절대경로를 이용해서 message.txt로부터 내용을 읽어오는 스트림 생성
		InputStreamReader fr = new InputStreamReader(new FileInputStream(filepath), "UTF-8");
		// message.txt로부터 읽어온 데이터를 out 기본객체를 사용해서 출력하기
		// != -1 ---> 읽을게 있을 때만 실행해라 
		while ((len = fr.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}		
	}
	
	catch(IOException e) {
		out.print("예외 발생 : " + e.getMessage());
	}
%>
</body>
</html>