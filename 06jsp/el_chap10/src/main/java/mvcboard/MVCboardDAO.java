package mvcboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class MVCboardDAO extends JDBCConnect {
	
	// 검색 조건에 맞는 게시물의 개수를 반환 
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "select count(*) from mvcboard";
		
		// 검색 조건이 있으면 where절 추가
		if(map.get("selectWord") != null) {
			query += " where " + map.get("searchField")+ " "
					+ " like '%"+map.get("searchWord")+"%'";
		} 
		
		 
		try {
			stmt = con.createStatement();	// 쿼리문 생성
				
			rs = stmt.executeQuery(query);	// 쿼리문 실행 
			
			rs.next();
			totalCount = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return totalCount;	// 게시물 수를 반환 
	}
	
	// 검색 조건에 맞는 게시물 목록을 반환 
	public List<MVCboardDTO> selectListPage(Map<String, Object> map) {
		List<MVCboardDTO> board = new ArrayList<>();
		
		// select * from (
		//	 select Td.*, rownum rNum from (
		// 		select * from mvcboard >where "검색" 자리< order by idx desc
		// 	 )
		// ) where rNum between 1 and 10
		
		String query = "select * from ( select Tb.*, rownum rNum from ("
						+ "select * from mvcboard";
		
		// 검색 조건이 있다면 where절 추가
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") 
				+ " like '%"+map.get("searchWord")+"%'";
		}
		
		query += " order by idx desc "
				+ " ) Tb "
				+ " ) "
				+ " where rNum between ? and ?";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());

			rs = psmt.executeQuery();

			// 게시물 목록을 list 컬렉션에 추가
			while(rs.next()) {
				MVCboardDTO dto = new MVCboardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
				
				board.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}
	
	// 게시글 추가하기 
	public int insertWrite(MVCboardDTO dto) {
		int result = 0;
		String query = "insert into mvcboard(idx, name, title, "
				+ "content,ofile,sfile,pass)"
				+ " values(seq_mvcboard_num.nextval,?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return result;
	}

	
	// 해당하는 게시글 DTO에 담아서 반환 
	public MVCboardDTO selectView(String idx) {
		MVCboardDTO dto = new MVCboardDTO();
		String query = "select * from mvcboard where idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				// 조회된 레코드 값을 dto객체의 필드값으로 지정 
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));	
			}		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}

	// 레코드의 조회수를 1 증가 
	public void updateVisitcount(String idx) {
		String query = "update mvcboard set visitcount=visitcount+1 "
				+ " where idx=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 입력한 비밀번호가 게시물의 비밀번호와 일치하는지 확인 
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		String query = "select count(*) from mvcboard" 
				+ " where pass=? and idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			
			rs = psmt.executeQuery();
			rs.next();
			
			if(rs.getInt(1) == 0) {
				isCorr = false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			isCorr = false;
			e.printStackTrace();
		}
		
		return isCorr;
	}
	
	// 게시물 삭제하기 
	public int deletePost(String idx) {
		int result = 0;
		
		String query = "delete from mvcboard where idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	// 게시글 업데이트하기 
	public int updatePost(MVCboardDTO dto) {
		int result = 0;
		String query = "update mvcboard set title=?, name=?, content=?"
				+",ofile=?, sfile=? where idx=? and pass=?";
		
		// 쿼리문 준비
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			
			// 쿼리문 실행 
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
