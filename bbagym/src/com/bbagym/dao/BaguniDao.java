package com.bbagym.dao;

import static com.bbagym.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bbagym.model.vo.Baguni;
import com.bbagym.model.vo.CenterEnroll;

public class BaguniDao {

	private Properties prop=new Properties();
	public BaguniDao() {
		try {
			String path=CenterDao.class.getResource("/sql/baguni/baguni_query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public void searchtrainer(Connection conn,List<Baguni> trainerlist) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("searchtrainer");
		for(Baguni ba : trainerlist) {
			System.out.println(ba);
		}
		try {
			
			for(Baguni ba : trainerlist) {
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ba.getPcode());
			pstmt.setInt(2, ba.getCount());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ba.setPname(rs.getString("p_name"));
				ba.setPrice(rs.getInt("price"));
				ba.setTmainimage(rs.getString("t_main_img"));
				ba.setMname(rs.getString("m_name"));
				}
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	}
	
	public void searchcenter(Connection conn,List<Baguni> centerlist) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("searchcenter");
		try {
			
			for(Baguni ba : centerlist) {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ba.getPcode());
			pstmt.setInt(2, ba.getMonth());
			rs=pstmt.executeQuery();
			
			
			while(rs.next()) {
				ba.setCname(rs.getString("c_name"));
				ba.setPrice(rs.getInt("price"));
				ba.setPname(rs.getString("p_name"));
				ba.setCmainimage(rs.getString("c_main_image"));
				}
			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

	}
	
}
