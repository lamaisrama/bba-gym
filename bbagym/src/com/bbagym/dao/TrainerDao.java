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

import com.bbagym.model.vo.Trainer;

public class TrainerDao {

	private Properties prop = new Properties();

	
	public TrainerDao() {
		// TODO Auto-generated constructor stub
		try {
			String path = TrainerDao.class.getResource("/sql/trainer_query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Trainer> AllTrainerDataList(Connection conn,int cPage,int numPerpage){
		
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<Trainer> list = new ArrayList<Trainer>();
		String sql =prop.getProperty("");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Trainer t =new Trainer();
				
				
				list.add(t);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}
}
