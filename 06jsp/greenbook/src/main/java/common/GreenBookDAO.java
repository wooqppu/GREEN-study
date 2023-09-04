package common;

import java.sql.SQLException;

public class GreenBookDAO extends JDBCConnect {
	
	//게시물 등록
	public int insertBook(GreenBookDTO dto) {
		int result = 0;
		String qurey = "insert into book(title, writer, company, price, regidate)" 
				+ " values(?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(qurey);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getWriter());
			psmt.setString(3, dto.getCompany());
			psmt.setString(4, dto.getPrice());
			psmt.setString(5, dto.getRegidate());

			result = psmt.executeUpdate();
			System.out.println("성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
}
