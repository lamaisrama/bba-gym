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

import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Program;
import com.bbagym.model.vo.TrainerEnroll;
import com.bbagym.model.vo.TrainerView;

public class MypageDao2 {
	private Properties prop = new Properties();
	
	public MypageDao2() {
		try {
			String path=MemberDao.class.getResource("/sql/mypage/mypage.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	


	public List<CenterEnroll> findMyCenter(Connection conn, int mCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//String sql = prop.getProperty("findMyCenter");
		String sql = "select * from center where m_code=?";
		List<CenterEnroll> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CenterEnroll c = new CenterEnroll();
				c.setCode(rs.getInt("c_code"));
				c.setName(rs.getString("c_name"));
				c.setAddress(rs.getString("c_address"));
				c.setTel(rs.getString("c_phone"));
				c.setApproval(rs.getString("approval"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<TrainerView> findMyTrainer(Connection conn, int mCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//String sql = prop.getProperty("findMyTrainer");
		//SELECT *  FROM (select * from trainer join member using(m_code)) where m_code=2;
		String sql = "select * from (select * from trainer join member m using(m_code)) A join center using (c_code) where A.m_code=?";
		List<TrainerView> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TrainerView tv = new TrainerView();
				tv.setTcode(rs.getInt("t_code"));
				tv.setMname(rs.getString("m_name"));
				tv.setCcenter(rs.getString("c_name"));
				tv.setApproval(rs.getString("approval"));
				tv.setEnrollDate(rs.getDate("t_enrolldate"));
				list.add(tv);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}



	public List<TrainerView> trainerBadge(Connection conn, List<TrainerView> list) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		//String sql =prop.getProperty("TrainerBadge");
		String sql="SELECT category.category_name FROM T_CATEGORY JOIN CATEGORY USING(CATEGORY_CODE) WHERE t_category.trainer_code=?";
		try {
			for(TrainerView tv : list) { // for문을 돌려 tcode별 카테고리를 가져오게 한다
				List<String> badgelist = new ArrayList<String>();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, tv.getTcode());
				rs=pstmt.executeQuery();
				while(rs.next()) {
					badgelist.add(rs.getString(1)); //resultset에 크기를 알수 없으므로 카테고리를 badgelist에 담아둔다
				}
				tv.setBadge(badgelist); //String배열을 list안에 객체 합쳐준다
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

		return list;
		
	}
	
	public CenterEnroll selectCenter(Connection conn, int cCode) {
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		CenterEnroll ce = null;
		String sql = "SELECT * FROM CENTER WHERE C_CODE=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cCode);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ce=new CenterEnroll();
				ce.setCode(rs.getInt(1));
				ce.setName(rs.getString(2));
				ce.setAddress(rs.getString(3));
				ce.setTel(rs.getString(4));
				ce.setOpHr(rs.getString(5));
				ce.setHoliday(rs.getString(6));
				ce.setSchedulePath(rs.getString(7));
				ce.setText(rs.getString(8));
				ce.setMainImage(rs.getString(9));
				ce.setApproval(rs.getString(10));
				ce.setMemberCode(rs.getInt(11));
				ce.setSnsHome(rs.getString(12));
				ce.setSnsInsta(rs.getString(13));
				ce.setSnsBlog(rs.getString(14));
				ce.setSnsEtc(rs.getString(15));
				ce.setEnrollDate(rs.getDate(16));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return ce;
	}
	
	public TrainerEnroll selectTrainer(Connection conn, int tCode) {
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		TrainerEnroll te = null;
		String sql = "SELECT * FROM TRAINER WHERE T_CODE=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, tCode);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				te = new TrainerEnroll();
				te.setCode(rs.getInt(1));
				te.setCounselHr(rs.getString(2));
				//te.setIntroduction(rs.getString(3)); -- 항상 비는 컬럼
				te.setCareer(rs.getString(4));
				te.setText(rs.getString(5));
				te.setMainImage(rs.getString(6));
				te.setApproval(rs.getString(7));
				te.setCenterCode(rs.getInt(8));
				te.setMemberCode(rs.getInt(9));
				te.setSnsHome(rs.getString(10));
				te.setSnsInsta(rs.getString(11));
				te.setSnsBlog(rs.getString(12));
				te.setSnsEtc(rs.getString(13));
				te.setEnrollDate(rs.getDate(14));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return te;
	}
	
	public int shiftDeleteCenter(Connection conn, CenterEnroll c) {
		PreparedStatement pstmt= null;
		String sql="INSERT INTO CENTER_OLD VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int result=0;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCode());
			pstmt.setString(2, c.getName()); pstmt.setString(3, c.getAddress()); 
			pstmt.setString(4, c.getTel()); pstmt.setString(5, c.getOpHr());
			pstmt.setString(6, c.getHoliday()); pstmt.setString(7, c.getSchedulePath());
			pstmt.setString(8, c.getText()); pstmt.setString(9, c.getMainImage());
			pstmt.setString(10, c.getApproval());
			pstmt.setInt(11, c.getMemberCode()); pstmt.setString(12, c.getSnsHome());
			pstmt.setString(13, c.getSnsInsta()); pstmt.setString(14, c.getSnsBlog());
			pstmt.setString(15, c.getSnsEtc()); pstmt.setDate(16, c.getEnrollDate());
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int shiftDeleteTrainer(Connection conn, TrainerEnroll te) {
		PreparedStatement pstmt= null;
		String sql="INSERT INTO TRAINER_OLD VALUES(?,?,null,?,?,?,?,?,?,?,?,?,?,?)";
		int result=0;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, te.getCode());
			pstmt.setString(2, te.getCounselHr());
			pstmt.setString(3, te.getCareer());
			pstmt.setString(4, te.getText());
			pstmt.setString(5, te.getMainImage());
			pstmt.setString(6, te.getApproval());
			pstmt.setInt(7, te.getCenterCode());
			pstmt.setInt(8, te.getMemberCode());
			pstmt.setString(9, te.getSnsHome());
			pstmt.setString(10, te.getSnsInsta());
			pstmt.setString(11, te.getSnsBlog());
			pstmt.setString(12, te.getSnsEtc());
			pstmt.setDate(13, te.getEnrollDate());
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteCenter(Connection conn, int cCode) {
		PreparedStatement pstmt= null;
		String sql="DELETE FROM CENTER WHERE C_CODE=?";
		int result=0;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cCode);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteTrainer(Connection conn, int tCode) {
		PreparedStatement pstmt= null;
		String sql="DELETE FROM TRAINER WHERE T_CODE=?";
		int result=0;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, tCode);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	public List<Program> selectProgram(Connection conn, int tCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_program where t_code=?";
		List<Program> programs = new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, tCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Program p = new Program();
				p.setpCode(rs.getInt("p_code"));
				p.setProgramName(rs.getString("p_name"));
				p.setStatus(rs.getString("status"));
				programs.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return programs;
	}



	public int changeStatus(Connection conn, int pCode, String status) {
		PreparedStatement pstmt= null;
		String sql="update t_program set status=? where p_code=?";
		int result=0;
		try{
			pstmt=conn.prepareStatement(sql);
			if(status.equals("Y")) {
				pstmt.setString(1, "N");
			}else {
				pstmt.setString(1, "Y");
			}
			pstmt.setInt(2, pCode);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertCenterOrderHistory(Connection conn, int mCode, String pCode, String month) {
		PreparedStatement pstmt= null;
		String sql="insert into c_order_history values(seq_coh.nextval, sysdate, add_months(sysdate, ?), ?, ?, ?, null, null)";
		int result=0;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(month));
			pstmt.setInt(2, Integer.parseInt(month));
			pstmt.setInt(3, Integer.parseInt(pCode));
			pstmt.setInt(4, mCode);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	public int insertTrainerOrderHistory(Connection conn, int mCode, String pCode, String count) {
		PreparedStatement pstmt= null;
		String sql="insert into t_order_history values(seq_coh.nextval, sysdate, ?, ?, ?, 0, null)";
		int result=0;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(pCode));
			pstmt.setInt(2, mCode);
			pstmt.setInt(3, Integer.parseInt(count));
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
