<%@page import="smtp.NaverSMTP"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	// 폼값 저장 
	Map<String, String> emailInfo = new HashMap<>();
	emailInfo.put("from", request.getParameter("from"));	// 보내는 사람 
	emailInfo.put("to", request.getParameter("to"));	// 받는 사람 
	emailInfo.put("subject", request.getParameter("subject"));	// 제목 
	
	// 내용은 메일 포맷에 따라 처리 
	String content = request.getParameter("content");
	String format = request.getParameter("format");
	
	if(format.equals("text")) {
		// 텍스트 포맷일 때는 그래도 저장 
		emailInfo.put("content", content);
		emailInfo.put("format", "text/plain;charset=UTF-8");		
	} else if(format.equals("html")) {
		content = content.replace("\r\n", "<br/>");	// 줄바꿈을 html 형태(/br)로 수정
		String htmlContent = "";
		
		// 경로 파일의 물리적인 경로는 받아옴
		String templatePath = application.getRealPath("/smtpmail/MailForm.html");
		BufferedReader br = new BufferedReader(new FileReader(templatePath));
		
		String oneLine;
		while((oneLine = br.readLine()) != null) {
			htmlContent += oneLine + "\n";
		}
		
		br.close();
		
		htmlContent = htmlContent.replace("__CONTENT__", content);
		
		emailInfo.put("content",htmlContent);
	    emailInfo.put("format","text/html;charset=UTF-8");
				
	}
	
	try{
	
	NaverSMTP smtpServer = new NaverSMTP();
	smtpServer.emailSending(emailInfo);
	out.println("이메일 전송 성공");
	
	} catch(Exception e) {
		out.println("이메일 전송 실패");
		e.printStackTrace();
	}
	
	
%>