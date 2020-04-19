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
import com.bbagym.model.vo.Msg;
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
	
	public int getreceivernum(Connection conn,String receiver) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rec = 0;
		
		String sql = prop.getProperty("getreceivernum");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, receiver);
			rs=pstmt.executeQuery();
			rs.next();
			rec= rs.getInt(1);
			
		}catch(SQLException e) {
			rec=0;
		}finally {
			close(pstmt);
			close(rs);
		}
		return rec;
	}
	
	public int sendmsg(Connection conn,String title,int receivernum,int sender,String content) {
		PreparedStatement pstmt = null;
		int result = 0;
	
		String sql = prop.getProperty("sendmsg");

		try {
			pstmt=conn.prepareStatement(sql);
			;
			pstmt.setInt(1, receivernum);
			pstmt.setInt(2, sender);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<Msg> getmsg(Connection conn ,int mcode){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Msg> list = new ArrayList<Msg>();
		String sql = prop.getProperty("getmsg");

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mcode);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Msg m = new Msg();
				m.setTitle(rs.getString("title"));
				m.setReadstatus(rs.getString("recv_read").charAt(0));
				m.setName(rs.getString("m_name"));
				m.setDate(rs.getDate("date_sent"));
				m.setMsgcode(rs.getInt("msg_code"));
				
				list.add(m);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return list;
	}
	
	public boolean checkdelte(Connection conn, int msgcode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag= false;
		String sql = prop.getProperty("checkdelte");

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, msgcode);
			
			rs=pstmt.executeQuery();
			
			rs.next();
			char status = rs.getString(1).charAt(0);
		
			if(status=='N') {
				flag= false; //안지운거
			}else {
				flag= true; //지운거
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return flag;
	}
	
	public int deletemsg(Connection conn,int msgcode,boolean flag) {
		PreparedStatement pstmt = null;
		int result = 0;
	
		String sql ="";
		
		if(flag) {
			sql=prop.getProperty("msgdelete");
		}else {
			sql=prop.getProperty("msgupdatedelete");
		}

		try {
			pstmt=conn.prepareStatement(sql);
			;
			pstmt.setInt(1, msgcode);

			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}
