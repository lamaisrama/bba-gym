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

import com.bbagym.model.vo.Center;
import com.bbagym.model.vo.CenterEnroll;

public class AdminDao {
	private Properties prop=new Properties();
	
	public AdminDao() {
		try {
			String path=MemberDao.class.getResource("/sql/admin/admin.properties").getPath();
			prop.load(new FileReader(path));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<CenterEnroll> searchKeywordPageData(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<CenterEnroll> list = new ArrayList<CenterEnroll>();
		String sql =prop.getProperty("searchKeywordPageData");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CenterEnroll c =new CenterEnroll();;
				c.setCode(rs.getInt("C_CODE"));
				c.setName(rs.getString("C_NAME"));
				c.setAddress(rs.getString("C_ADDRESS"));
				c.setTel(rs.getString("C_PHONE"));
				c.setApproval(rs.getString("APPROVAL"));
				c.setMainImage(rs.getString("C_MAIN_IMAGE"));
			
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
	public int searchCountCenter(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select문을 썻으면 rs가 필요함.
		int result = 0;
		String sql = prop.getProperty("selectCountCenter");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1); // 컬럼이 1나면 인덱스로 1써두된다.

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}


