package com.bbagym.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import com.bbagym.model.vo.Price;
import com.bbagym.model.vo.Program;
import com.bbagym.model.vo.TrainerEnroll;
import static com.bbagym.common.JDBCTemplate.close;

public class TrainerEnrollDao {
	
	private Properties prop = new Properties();
	
	public TrainerEnrollDao() {
		String path = TrainerEnrollDao.class.getResource("/sql/trainer/t-enroll-query.properties").getPath();
		try {			
			prop.load(new FileInputStream(path));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int enrollTrainer(Connection conn, TrainerEnroll te) {
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("enrollTrainer");
		int result=0;
		try {
			//(seq_t.nextval, ?, null, ?, ?, ?, null, ?, ?, ?, ?, ?, ?)
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, te.getCounselHr());
			pstmt.setString(2, te.getCareer());
			pstmt.setString(3, te.getText());
			pstmt.setString(4, te.getMainImage());
			pstmt.setInt(5, te.getCenterCode());
			pstmt.setInt(6, te.getMemberCode());
			pstmt.setString(7, te.getSnsHome());
			pstmt.setString(8, te.getSnsInsta());
			pstmt.setString(9, te.getSnsBlog());
			pstmt.setString(10, te.getSnsEtc());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectTcode(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tCode=0;
		String sql = prop.getProperty("selectTcode");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			tCode=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return tCode;
	}
	
	public int insertTrainerCategory(Connection conn, TrainerEnroll te) {

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertT-category");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(2, te.getCode());
			List<String> categories = te.getCategories();
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
	
	public int insertTrainerImage(Connection conn, TrainerEnroll te) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertT-image");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, te.getCode());
			for(String s : te.getPhotos()) {
				pstmt.setString(2, s);
				result+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertProgram(Connection conn, TrainerEnroll te) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertT-Program");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			List<Program> programs= te.getProgram();
			for(Program p : programs) {
				pstmt.setString(1, p.getProgramName());
				pstmt.setInt(2, te.getCode());
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
		String sql = prop.getProperty("insertT-Price");
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
	
	

}
