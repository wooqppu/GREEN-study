package member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class MemberDAO extends JDBCConnect {
	
	// 아이디와 패스워드에 일치하는 회원 정보를 반환 
	public MemberDTO getMemberDTO(String id, String pass) {
		MemberDTO dto = new MemberDTO();
		String sql = "select * from member where id=? and pass=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	// 회원 추가하기 
	public int insertMember(MemberDTO dto) {
		int result = 0;
		String sql = "insert in member values(?,?,?,sysdate)";
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
	
	// 회원 목록 반환 
	public List<MemberDTO> getMemberList() {
		List<MemberDTO> memberlist = new ArrayList<MemberDTO>();
		String sql = "select * from member";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
				memberlist.add(dto);
			} 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberlist;
	}

}
