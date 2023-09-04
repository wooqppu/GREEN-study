package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCConnect {
	public Connection con;	// 데이터베이스 연결 담당
	public Statement stmt;	// 정적쿼리문 작성
	public PreparedStatement psmt;	// 동적쿼리문 작성
	public ResultSet rs;	// select 쿼리문 결과 저장타입
	
	// 기본 생성자
	public JDBCConnect() {
		// JDBC드라이버 로드 
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "green";
			String pwd = "green1234";
			
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	// 연결 해지 
	public void close() {
		
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(psmt != null) psmt.close();
				if(con != null) con.close();
				
				System.out.println("JDBC 해제");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	
}
