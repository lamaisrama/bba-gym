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
	
	//모든 트레이너 데이터를 가져오는 dao 페이징처리
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
	
	// list를 보내어  트레이너별 카테고리 다중값을 다시 넣어주는 dao
	public List<TrainerView> TrainerBadge(Connection conn,List<TrainerView> list){ 
		
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<String> badgelist = new ArrayList<String>();
		String sql =prop.getProperty("TrainerBadge");
		
		try {

			for(int i=0;i<list.size();i++) { // for문을 돌려 tcode별 카테고리를 가져오게 한다
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, list.get(i).getT_code());
			
			rs=pstmt.executeQuery();
			
			
			while(rs.next()) {
				badgelist.add(rs.getString(1)); //resultset에 크기를 알수 없으므로 카테고리를 badgelist에 담아둔다
			}
			
			String[] badgeString=new String[badgelist.size()]; //담겨준 badgelist에 크기에 따라 String배열을 만든다
			
			for(int j=0;j<badgelist.size();j++) {
				badgeString[j]=badgelist.get(j); //다시 badgelist에 값을 String 배열에 추가해준다
			}
			
			
			list.get(i).setBadge(badgeString); //String배열을 list안에 객체 합쳐준다
			badgelist.clear(); // badgelist초기화
			
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		


		return list;
		
	}
	
	//모든 트레이너 데이터를 가져오는 dao 논페이징처리
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
	
	// 검색에 타입과 키워드에따라 트레이너 데이터를 가져오는 dao 페이징처리 (이름,소속)
	public List<TrainerView> searchTrainerData(Connection conn,int cPage,int numPerpage,String type,String searchKeyword){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<TrainerView> list = new ArrayList<TrainerView>();
		String sql =prop.getProperty("searchTrainerData");
		sql=sql.replace("type", type);
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKeyword+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
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
	
	// 검색에 타입과 키워드에따라 트레이너 모든 데이터를 가져오는 dao 논페이징처리 (이름,소속)
	public int serachTrainerAllData(Connection conn, String type, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result =0;
		String sql =prop.getProperty("serachTrainerAllData");
		sql=sql.replace("type", type);
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKeyword+"%");
			
			rs=pstmt.executeQuery();
			
			rs.next();
			result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	// 검색에 타입과 키워드에따라 트레이너 데이터를 가져오는 dao 페이징처리 (카테고리)
	public List<TrainerView> searchTrainerData2(Connection conn,int cPage,int numPerpage,String searchKeyword){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<TrainerView> list = new ArrayList<TrainerView>();
		String sql =prop.getProperty("searchTrainerData2");

		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKeyword+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
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
	
	// 검색에 타입과 키워드에따라 트레이너 모든 데이터를 가져오는 서비스 논페이징처리 (카테고리)
	public int serachTrainerAllData2(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result =0;
		String sql =prop.getProperty("serachTrainerAllData2");
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKeyword+"%");
			
			rs=pstmt.executeQuery();
			
			rs.next();
			result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
}


