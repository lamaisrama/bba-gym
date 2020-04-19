package com.bbagym.dao;

import static com.bbagym.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bbagym.model.vo.Member;
import com.bbagym.model.vo.MypageUser;

public class MypageDao {

	private Properties prop = new Properties();
	
	public MypageDao() {
		try {
			String path=MemberDao.class.getResource("/sql/mypage/mypage.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<MypageUser> findCenterData(Connection conn,int mcode){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MypageUser> list = new ArrayList<MypageUser>();
		String sql = prop.getProperty("findCenterData");
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mcode);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MypageUser my = new MypageUser();
				my.setCname(rs.getString("c_name"));
				my.setPname(rs.getString("p_name"));
				my.setMonth(rs.getInt("month"));
				my.setPaydate(rs.getDate("order_date"));
				my.setExpiredate(rs.getDate("order_expire_date"));
				my.setScore(rs.getInt("score"));
				my.setCcode(rs.getInt("c_code"));
				
				list.add(my);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public List<MypageUser> findTrainerData(Connection conn,int mcode){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MypageUser> list = new ArrayList<MypageUser>();
		String sql = prop.getProperty("findTrainerData");
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mcode);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MypageUser my = new MypageUser();
				my.setCcode(rs.getInt("t_code"));
				my.setCname(rs.getString("c_name"));
				my.setPname(rs.getString("p_name"));
				my.setCount(rs.getInt("count"));
				my.setPaydate(rs.getDate("order_date"));
				my.setScore(rs.getInt("score"));
				
				list.add(my);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public List<MypageUser> findMyPerfer(Connection conn,int mcode){ 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MypageUser> list = new ArrayList<MypageUser>();
		String sql = prop.getProperty("findMyPerfer");
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mcode);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MypageUser my = new MypageUser();
				my.setCcode(rs.getInt("c_code"));
				my.setCname(rs.getString("c_name"));
				my.setAddress(rs.getString("c_address"));
				my.setPhone(rs.getString("c_phone"));
				
				list.add(my);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public void getScore(Connection conn,List<MypageUser> list) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("getScore");
		try {
			
			
			for(MypageUser my : list) {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, my.getCcode());
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				my.setAvgscore(rs.getDouble("ROUND(SUM(SCORE)/COUNT(*),1)"));
			}
			
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public Member getUpdateInfo(Connection conn, int mCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = new Member();
		
		String sql = prop.getProperty("getUpdateInfo");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mCode);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m.setM_NAME(rs.getString("m_name"));
				m.setM_IMAGE(rs.getString("m_image"));
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return m;
	}
	
	
}
