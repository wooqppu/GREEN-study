package board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class BoardDAO extends JDBCConnect {
	
	// 검색 조건에 맞는 게시물의 개수 반환하기 
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		// 게시물 수를 얻어오는 쿼리 작성 
		String sql = "select count(*) from board";
		// 검색 요청이 있을 경우 where절 추가하기 
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%"+ map.get("searchWord") + "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	
	// 목록 리스트 나타내기
	public List<BoardDTO> getBoardList(Map<String, Object> map) {
		List<BoardDTO> boardlist = new ArrayList<>();
		String sql = "select * from ("
				+ "select Tb.*, rownum rnum from ("
				+ "select * from board";
		
		// map에 검색어가 있으면
		// "select * from board where title like '%검색어%'"
		// "select * from board where + map.get("searchField") + like '%"+map.get("searchWord")+"%'"
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%"+ map.get("searchWord") + "%'";
		}
		
		sql += " order by num desc ) Tb"
				+ ") where rnum between ? and ?";
		
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {	
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setCompany(rs.getString("company"));
				dto.setPrice(rs.getString("price"));
				dto.setRegidate(rs.getString("regidate"));
				
				boardlist.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardlist;
	}
	
	// 게시글 등록하기 
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		String query = "insert into board(num, title, name, company, price, regidate)" 
		+ " values(seq_board_num.nextval,?,?,?,?,sysdate)";
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getCompany());
			psmt.setString(4, dto.getPrice());
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 게시글 하나 조회하기 
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		String query = "select * from board where num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setCompany(rs.getString("company"));
				dto.setPrice(rs.getString("price"));
				dto.setRegidate(rs.getString("regidate"));			
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	// 지정한 게시글에 조회수 업데이트 하기 
//	public void updateVisitcount(String num) {
//		String query = "update board set visitcount=visitcount+1" + " where num=?";
//		try {
//			psmt = con.prepareStatement(query);
//			psmt.setString(1, num);
//			psmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}	
	
	// 게시글 수정하기 
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		String query = "update board set title=?, company=? where num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getCompany());
			psmt.setString(3, dto.getNum());
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 게시글 삭제하기 
	public int deletePost(String num) {
		int result = 0;
		String query = "delete from board where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
}
