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
import com.bbagym.model.vo.TrainerDetail;
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
	
}
