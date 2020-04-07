package com.bbagym.dao;

import static com.bbagym.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bbagym.model.vo.Center;
import com.bbagym.model.vo.CenterEnroll;

public class CenterDao {
	private Properties prop=new Properties();
	
	public CenterDao() {
		try {
			String path=CenterDao.class.getResource("/sql/center/center_query.properties").getPath();
			prop.load(new FileInputStream(path));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int enrollCenter(Connection conn, CenterEnroll c) { 
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("enrollCenter");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);

			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public List<CenterEnroll> centerView(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//String sql = prop.getProperty("selectCenter");
		String sql = "select * from (select rownum as rnum, a.* from (select * from center where approval='Y') a) where rnum between ? and ?";
		List<CenterEnroll> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CenterEnroll c = new CenterEnroll();
				c.setCode(rs.getInt("c_code"));
				c.setName(rs.getString("c_name"));
				c.setAddress(rs.getString("c_address"));
				c.setMainImagePath(rs.getString("c_main_image"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int selectCountCenter(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql = "select count(*) from center";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public void findCategory(Connection conn, CenterEnroll ce) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ce.setCategories(new ArrayList());
		//String sql = prop.getProperty("findCategory");
		String sql = "select * from c_category join category using (category_code) where center_code=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ce.getCode());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ce.getCategories().add(rs.getString("category_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

	}
	
	public void findFacility(Connection conn, CenterEnroll ce) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ce.setFacilities(new ArrayList());
		String sql = "SELECT * FROM CENTER_FACILITY JOIN FACILITY USING(F_CODE) WHERE C_CODE=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ce.getCode());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ce.getFacilities().add(rs.getString("f_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
	}
}
