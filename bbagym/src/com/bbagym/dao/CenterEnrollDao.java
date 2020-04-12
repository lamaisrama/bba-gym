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

import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Price;
import com.bbagym.model.vo.Program;

public class CenterEnrollDao {
	private Properties prop=new Properties();
	
	public CenterEnrollDao() {
		try {
			String path=CenterEnrollDao.class.getResource("/sql/center/c-enroll-query.properties").getPath();
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
			pstmt.setString(1, c.getName()); pstmt.setString(2, c.getAddress()); 
			pstmt.setString(3, c.getTel()); pstmt.setString(4, c.getOpHr());
			pstmt.setString(5, c.getHoliday()); pstmt.setString(6, c.getSchedulePath());
			pstmt.setString(7, c.getText()); pstmt.setString(8, c.getMainImage());
			pstmt.setInt(9, c.getMemberCode()); pstmt.setString(10, c.getSnsHome());
			pstmt.setString(11, c.getSnsInsta()); pstmt.setString(12, c.getSnsBlog());
			pstmt.setString(13, c.getSnsEtc());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectCcode(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cCode=0;
		String sql = prop.getProperty("selectCcode");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			cCode=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return cCode;
	}

	public int insertCenterCategory(Connection conn, CenterEnroll c) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertC-category");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(2, c.getCode());
			List<String> categories = c.getCategories();
			for(String s : categories) {
				pstmt.setInt(1, Integer.parseInt(s));
				result+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertCenterFacility(Connection conn, CenterEnroll c) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertC-facility");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCode());
			List<String> facilities = c.getFacilities();
			for(String s : facilities) {
				pstmt.setInt(2, Integer.parseInt(s));
				result+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertCenterImage(Connection conn, CenterEnroll c) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertC-image");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCode());
			for(String s : c.getPhotos()) {
				pstmt.setString(2, s);
				result+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertProgram(Connection conn, CenterEnroll c) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertC-Program");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			List<Program> programs= c.getProgram();
			for(Program p : programs) {
				pstmt.setString(1, p.getProgramName());
				pstmt.setInt(2, c.getCode());
				result+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int selectPcode(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int pCode=0;
		String sql = prop.getProperty("selectPcode");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			pCode=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return pCode;
	}

	public int insertProgramPrice(Connection conn, int pCode, Price price) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertP-Price");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pCode);
			pstmt.setInt(2, price.getPrice());
			pstmt.setInt(3, price.getMonth());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertCenterXY(Connection conn, CenterEnroll c) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAddrXY");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCode());
			pstmt.setString(2, c.getAddrX());
			pstmt.setString(3, c.getAddrY());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}