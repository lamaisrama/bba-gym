package com.bbagym.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bbagym.model.vo.Board;

import static com.bbagym.common.JDBCTemplate.close;

public class BoardDao {

	private Properties prop = new Properties();

	public BoardDao() {
		
		try {
			String path = NoticeDao.class.getResource("/sql/board/board-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<Board> selectBoardList(Connection conn, int cPage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		String sql = prop.getProperty("selectBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board b = new Board();
				b.setQaCode(rs.getInt("qa_code"));
				b.setTitle(rs.getString("title"));
				b.setQaContent(rs.getString("qa_content"));
				b.setQaDate(rs.getDate("qa_date"));
				b.setOriFileName(rs.getString("ori_filename"));
				b.setNewFileName(rs.getString("new_filename"));
				b.setReadCount(rs.getInt("readcount"));
				b.setmCode(rs.getInt("m_code"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = prop.getProperty("selectBoardCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}

	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertBoard");
		//insertBoard=INSERT INTO QA VALUES(SEQ_QA.NEXTVAL,?,?,DEFAULT,?,?,DEFAULT,?)
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getQaContent());
			pstmt.setString(3, b.getOriFileName());
			pstmt.setString(4, b.getNewFileName());
			pstmt.setInt(5, b.getmCode());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Board selectBoard(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board b = null;
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				b = new Board();
				b.setQaCode(rs.getInt(rs.getInt("qa_code")));
				b.setTitle(rs.getString("title"));
				b.setQaContent(rs.getString("qa_content"));
				b.setQaDate(rs.getDate("qa_date"));
				b.setOriFileName(rs.getString("ori_filename"));
				b.setNewFileName(rs.getString("new_filename"));
				b.setReadCount(rs.getInt("readcount"));
				b.setmCode(rs.getInt("m_code"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}

	public int updateReadCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateReadCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteBoard(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateBoard(Connection conn, Board b) {
		PreparedStatement pstmt =  null;
		int result = 0;
		String sql = prop.getProperty("updateBoard");
		//UPDATE QA SET TITLE=?, QA_CONTENT=?, ORI_FILENAME=?, M_CODE=? WHERE QA_CODE=?
		if(!b.getOriFileName().equals("null")) {
			sql = prop.getProperty("updateBoard");
		}else {
			sql = prop.getProperty("updateBoard2");
		}
		
		try {
			if(!b.getOriFileName().equals("null")) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, b.getTitle());
				pstmt.setString(2, b.getQaContent());
				pstmt.setString(3, b.getOriFileName());
				pstmt.setInt(4, b.getmCode());
				pstmt.setInt(5, b.getQaCode());
				
			}else {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, b.getTitle());
				pstmt.setString(2, b.getQaContent());
				pstmt.setInt(3, b.getmCode());
				pstmt.setInt(4, b.getQaCode());
			}
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	

	
	
	
	
	
	
	
	
	
	
}
