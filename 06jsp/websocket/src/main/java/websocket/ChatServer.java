package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {

	// Collections 클래스 synchronizedSet() : 멀티스레드 환경에서 안전한 Set 컬렉션을 생성 
	// Set은 순서를 유지하지 않고 저장하며, 중복 저장이 불가능함  
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>()); 

	@OnOpen	// 클라이언트 접속 시 실행 
	public void onOpen(Session session) {
		clients.add(session);	// 세션 추가
		System.out.println("웹소켓 연결 : " + session.getId());
	}
	
	@OnMessage	// 메세지를 받으면 실행 
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("메세지 전송 : " + session.getId() + " : " + message);
		
		// 동기화 블럭
		synchronized (clients) {
			for(Session client : clients) {
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	@OnClose	// 클라이언트와 연결이 끊기면 실행
	public void onClose(Session  session) {
		clients.remove(session);
		System.out.println("웹소켓 종료 : " + session.getId());
	}
	
	@OnError
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
	}
}
