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

import static com.bbagym.common.JDBCTemplate.close;

import com.bbagym.model.vo.Notice;

public class NoticeDao {

	private Properties prop = new Properties();

	public NoticeDao() {
		try {
			String path = NoticeDao.class.getResource("/sql/board/notice-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<Notice> selectNoticeList(Connection conn, int cPage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList();
		String sql = prop.getProperty("selectNoticeList");
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Notice n = new Notice();
				n.setnCode(rs.getInt("n_code"));
				n.setTitle(rs.getString("title"));
				n.setnContent(rs.getString("n_content"));
				n.setnDate(rs.getDate("n_date"));
				n.setOriFileName(rs.getString("ori_filename"));
				n.setNewFileName(rs.getString("new_filename"));
				n.setReadCount(rs.getInt("readcount"));
				n.setmCode(rs.getString("m_code"));
				n.setnStatus(rs.getString("n_status").charAt(0));
				list.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = prop.getProperty("selectNoticeCount");
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

	public int insertNotice(Connection conn, Notice n) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getTitle());
			pstmt.setString(2, n.getmCode());
			pstmt.setString(3, n.getnContent());
			pstmt.setString(4, n.getOriFileName());
			pstmt.setString(5, n.getNewFileName());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Notice selectNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Notice n = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n = new Notice();
				n.setnCode(rs.getInt("n_code"));
				n.setTitle(rs.getString("title"));
				n.setnContent(rs.getString("n_content"));
				n.setnDate(rs.getDate("n_date"));
				n.setOriFileName(rs.getString("ori_filename"));
				n.setNewFileName(rs.getString("new_filename"));
				n.setmCode(rs.getString("m_code"));
				n.setReadCount(rs.getInt("readcount"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return n;
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
