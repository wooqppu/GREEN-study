<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let webSocket = new WebSocket("ws://localhost:8090/websocket/ChatingServer");
	
	// 변수 선언
	let chatWindow, chatMessage, chatId;
	
	// 창이 열리면 
	window.onload = function() {
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		chatId = document.getElementById("chatId").value;
	}
	
	// 메세지 전송 
	function sendMessage() {
		chatWindow.innerHTML += "<div class='myMsg'>"+ chatMessage.value + "</div>";
		
		// 서버로 메세지 전송 (아이디 | 내용)
		webSocket.send(chatId + " | " + chatMessage.value);
		chatMessage.value = "";
		chatWindow.scrollTop = chatWindow.scrollHeight;
	}
	
	// 채팅종료
	function disconnect() {
		webSocket.close();
	}
	
	// 엔터키 입력 처리 
	function enterKey() {
		if(window.event.keyCode == 13) {	// Enter키의 코드값 : 13
			sendMessage();
		}
	}
	
	// 웹소켓 서버에 연결되었을 때 실행 
	webSocket.onopen = function(event) {
		chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다. <br/>";
	}
	
	// 웹소켓이 닫혔을 때 실행 
	webSocket.onclose = function(event) {
		chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다. <br/>";
	}
	
	// 웹소켓 에러가 발생했을 때 실행 
	webSocket.onerror = function(event) {
		alert(event.data);
		chatWindow.innerHTML += "채팅 중 에러가 발생했습니다. <br/>";
	}
	
	// 웹소켓 서버로부터 메세지를 받았을 때
	webSocket.onmessage = function(event) {
		let message = event.data.split("|"); // 구분자 "|"를 사용해서 배열로 리턴
		let sender = message[0];
		let content = message[1];
		
		if(content != "") {
			// 귓속말 기능 이용 시 "/그린 안녕"으로 뜨게 함
			if(content.match("/")) {	// 귓속말인지 체크 
				if(content.match("/"+ chatId)) {	// 내게 보낸 귓속말이냐?
					let temp = content.replace(("/"+chatId), "[귓속말] : ");
					chatWindow.innerHTML += "<div>"+ sender + " : " + temp + "</div>";
				}
			} 
			else {
				chatWindow.innerHTML += "<div>"+ sender + " : " + content + "</div>";
			}
			
			// 스크롤 값 지정해줌 -> 자동으로 채팅창 스크롤 생김
			chatWindow.scrollTop = chatWindow.scrollHeight;
		}
	}	
</script>
<style>
	#chatWindow {
		border: 1px solid black;
		width: 270px;
		height: 310px;
		overflow: scroll;
		padding: 5px;
	}
	
	#chatMessage {
		margin-top: 10px;
		width: 236px;
		height: 30px;
	}
	
	#sendBtn {
		margin-top: 10px;
		height: 30px;
		position: relative;
		top: 2px;
		left: -2px;
	}
	
	#closeBtn {
		margin-bottom: 3px;
		position: relative;
		top: 2px;
		left: -2px; 
	}
	
	#chatId {
		width: 158px;
		height: 24px;
		border: 1px solid #aaa;
		background-color: #eee;
	}
	
	.myMsg {
		text-align: center;
	}
	
</style>
</head>
<body>
	아이디 : 
	<input type="text" id="chatId" value="${param.chatId}" readonly />
	<button id="closeBtn" onclick="disconnect();">채팅종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey();" />
		<button id="sendBtn" onclick="sendMessage();">전송</button>
	</div>
</body>
</html>