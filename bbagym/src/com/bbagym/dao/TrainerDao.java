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
import com.bbagym.model.vo.TrainerView;

public class TrainerDao {

	private Properties prop = new Properties();

	
	public TrainerDao() {
		// TODO Auto-generated constructor stub
		try {
			String path = TrainerDao.class.getResource("/sql/trainer/trainer_query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<TrainerView> AllTrainerDataList(Connection conn,int cPage,int numPerpage){
		
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<TrainerView> list = new ArrayList<TrainerView>();
		String sql =prop.getProperty("AllTrainerDataList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			System.out.println(sql);
			while(rs.next()) {
				TrainerView tv = new TrainerView();
				
				tv.setT_code(rs.getInt("t_code"));
				tv.setT_img(rs.getString("t_img"));
				tv.setM_name(rs.getString("m_name"));
				tv.setC_center(rs.getString("c_name"));
				tv.setM_addres2(rs.getString("m_address_2"));
				
				list.add(tv);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	
	public List<TrainerView> TrainerBadge(Connection conn,List<TrainerView> list){
		
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<String> badgelist = new ArrayList<String>();
		String sql =prop.getProperty("TrainerBadge");
		
		try {
			
			for(int i=0;i<list.size();i++) {
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, list.get(i).getT_code());
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				badgelist.add(rs.getString(1));
			}
			
			String[] badgeString=new String[badgelist.size()];
			
			for(int j=0;j<badgelist.size();j++) {
				badgeString[j]=badgelist.get(j);
			}
			
			String.join(",", badgeString);
			
			list.get(i).setBadge(badgeString);
			badgelist.clear();
			
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public int AllTrainerDataCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result =0;
		String sql =prop.getProperty("AllTrainerDataCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);

			
			rs=pstmt.executeQuery();
			
			rs.next();
			result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
}
