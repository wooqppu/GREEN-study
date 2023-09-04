<%@page import="fileUpload.MyfileDAO"%>
<%@page import="fileUpload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// getRealPath() -> 물리적 경로를 리턴
	String saveDirectory = application.getRealPath("/uploads");
	
	int maxPostSize = 1024*1000;	// 파일 최대 크기 
	String encoding = "UTF-8";		// 인코딩 방식
	
	
	try{
		
		// MultipartRequest 객체 생성 
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		// 파일명 생성
		// ex> myphoto.set.png -> 마지막에 있는 .을 찾은 후 그 다음 내용(확장자)이 ext에 담김 
		String fileName = mr.getFilesystemName("attachedFile");		// 현재 파일 이름 받아오기 
		String ext = fileName.substring(fileName.lastIndexOf("."));		// 파일 확장자 따로 저장 
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now+ext;	// 새로운 파일 이름 : 업로드 일시.확장자
		
		// 파일명 변경 
		File oldFile = new File(saveDirectory+File.separator + fileName);
		File newFile = new File(saveDirectory+File.separator + newFileName);
		
		oldFile.renameTo(newFile);		// 파일 이름 변경 
		
		// 다른 폼값 처리 
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String[] cateArray = mr.getParameterValues("cate");
		StringBuffer cateBuf = new StringBuffer();
		
		// StringBuffer : 문자열을 추가하거나 변경할 때 주로 사용하는 자료형 
		// append() : 문자열을 추가 
		// toString() : String 자료형으로 리턴
		
		if(cateArray == null) {
			cateBuf.append("선택 없음");
		} else {
			for(String s : cateArray) {
				cateBuf.append(s + ",");
			}
		}
		
		// DTO 생성 
		MyfileDTO dto = new MyfileDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		
		// DAO를 통해 데이터베이스 반영 
		MyfileDAO dao = new MyfileDAO();
		dao.insertFile(dto);
		dao.close();
		
		// 파일 목록 jsp로 리다이렉션 
		response.sendRedirect("filelist.jsp");
		
	}
	catch(Exception e) {
		e.printStackTrace();
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("fileUpload.jsp")
		.forward(request, response);
	}
	
%>
