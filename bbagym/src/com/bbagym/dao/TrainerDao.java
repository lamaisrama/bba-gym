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

import com.bbagym.model.vo.Center;
import com.bbagym.model.vo.Trainer;
import com.bbagym.model.vo.TrainerDetail;
import com.bbagym.model.vo.TrainerView;

import static com.bbagym.common.JDBCTemplate.close;

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
				tv.setT_img(rs.getString("t_main_img"));
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
				tv.setT_img(rs.getString("t_main_img"));
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
				tv.setT_img(rs.getString("t_main_img"));
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

	
	public List<Center> searchCenterName(Connection conn,String name) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		List<Center> list = new ArrayList<Center>();
		String sql =prop.getProperty("searchCenterName");
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Center c = new Center();
				c.setcCode(rs.getInt("C_CODE"));
				c.setcName(rs.getString("C_NAME"));
				c.setcAddress(rs.getString("C_ADDRESS"));
				list.add(c);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public TrainerDetail trainerViewDetail(Connection conn, int t_code) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("trainerDetail");
		TrainerDetail td=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, t_code);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				td = new TrainerDetail();
				td.setProf_img(rs.getString("t_img"));
				td.setT_name(rs.getString("m_name"));
				td.setT_intro(rs.getString("t_introduction"));
				td.setM_phone_2(rs.getString("M_PHONE_2"));
				td.setM_address_2(rs.getString("M_ADDRESS_2"));
				td.setT_text(rs.getString("t_text"));
				td.setT_career(rs.getString("T_CAREER"));
				td.setT_counsel_hours(rs.getString("T_COUNSEL_HOURS"));
				td.setC_name(rs.getString("C_NAME"));
				td.setT_sns_url(rs.getString("SNS_URL"));
				td.setT_sns_type(rs.getString("SNS_TYPE"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(td);
		return td;
		
	}
	
	public void trainerViewDetailPrograms(Connection conn, int t_code,TrainerDetail td) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		td.setT_program_name(new ArrayList());//리스트 초기값 세팅
		
		String sql = prop.getProperty("getTrainerPrograms");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, t_code);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				//List<String> temp=td.getT_program_name();
				td.getT_program_name().add(rs.getString("p_name"));
				td.getT_price().add(rs.getInt("price"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	}
	
}


