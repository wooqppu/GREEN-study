<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
	<h2>회원 정보 보기</h2>
	<table>
		<tr>
			<td>회원번호</td>
			<td>${ dto.idx }</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${ dto.id }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${ dto.name }</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${ dto.birthday }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${ dto.email }</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>${ dto.postnumber }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${ dto.address }</td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td>${ dto.address1 }</td>
		</tr>
		<tr>
			<td>예치금</td>
			<td>${ dto.money }</td>
		</tr>
		<tr>
			<td>구매목록</td>
			<td>${ dto.purchase }</td>
		</tr>
		<tr>
			<td colspan="2">
				<button>수정하기</button>
				<button>삭제하기</button>
				<button onclick="history.back();'">목록으로 되돌아가기</button>			
			</td>
		</tr>	
	</table>
<%@ include file="/include/footer.jsp" %>