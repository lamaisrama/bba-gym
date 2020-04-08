package com.bbagym.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.bbagym.model.vo.Price;
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
			pstmt=conn.prepareStatement(sql);
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectTcode(Connection conn) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertTrainerCategory(Connection conn, TrainerEnroll te) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertTrainerImage(Connection conn, TrainerEnroll te) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertProgram(Connection conn, TrainerEnroll te) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int selectPcode(Connection conn) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertProgramPrice(Connection conn, int getpCode, Price price) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
