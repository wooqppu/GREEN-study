<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>Forward Tag Example2</h2>
 <h3>
 	혈액형 성격 테스트
 	당신의 혈액형은?
 </h3>
 <form method="post" action="forward_result.jsp">
 	<input type="radio" name="bloodType" value="A" /> A형 <br/>
 	<input type="radio" name="bloodType" value="B" /> B형 <br/>
 	<input type="radio" name="bloodType" value="O" /> O형 <br/>
 	<input type="radio" name="bloodType" value="AB" /> AB형 <br/>
 	<input type="submit" value="보내기" />
 </form>
</body>
</html>