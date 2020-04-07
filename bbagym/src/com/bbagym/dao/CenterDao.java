package com.bbagym.dao;

import static com.bbagym.common.JDBCTemplate.close;

import java.io.FileInputStream;
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
import com.bbagym.model.vo.TrainerView;

public class CenterDao {
	private Properties prop=new Properties();
	
	public CenterDao() {
		try {
			String path=CenterDao.class.getResource("/sql/center/center_query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int enrollCenter(Connection conn, CenterEnroll c) { 
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("enrollCenter");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);

			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public List<CenterEnroll> centerView(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//String sql = prop.getProperty("selectCenter");
		String sql = "select * from (select rownum as rnum, a.* from (select * from center where approval='Y') a) where rnum between ? and ?";
		List<CenterEnroll> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CenterEnroll c = new CenterEnroll();
				c.setCode(rs.getInt("c_code"));
				c.setName(rs.getString("c_name"));
				c.setAddress(rs.getString("c_address"));
				c.setMainImage(rs.getString("c_main_image"));
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
	
	//센터에서 탈퇴멤버가아니며 승인받은 센터의 갯수를 가져오는 메소드
	public int selectCountCenter(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql = prop.getProperty("selectCountCenter");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public void findCategory(Connection conn, CenterEnroll ce) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ce.setCategories(new ArrayList());
		//String sql = prop.getProperty("findCategory");
		String sql = "select * from c_category join category using (category_code) where center_code=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ce.getCode());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ce.getCategories().add(rs.getString("category_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

	}
	
	//센터 리스트를 받아와 각 센터에 카테고리를 받아오는 메소드
	public List<CenterEnroll> FindCatergoryList(Connection conn,int cPage,int numPerpage,List<CenterEnroll> list){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<String> category=new ArrayList<String>();
		String sql=prop.getProperty("FindCatergoryList");
		try {
			
			for(int i=0;i<list.size();i++) {
			category.clear();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, list.get(i).getCode());
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				category.add(rs.getString("CATEGORY_NAME"));
			}


			list.get(i).setCategories(category);
			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void findFacility(Connection conn, CenterEnroll ce) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ce.setFacilities(new ArrayList());
		String sql = "SELECT * FROM CENTER_FACILITY JOIN FACILITY USING(F_CODE) WHERE C_CODE=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ce.getCode());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ce.getFacilities().add(rs.getString("f_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
	}
	
	public List<CenterEnroll> centerMainPageData(Connection conn,int cPage,int numPerpage){ 
		
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<CenterEnroll> list = new ArrayList<CenterEnroll>();
		String sql =prop.getProperty("centerMainPageData");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CenterEnroll c =new CenterEnroll();
				
				c.setCode(rs.getInt("C_CODE"));
				c.setName(rs.getString("C_NAME"));
				c.setAddress(rs.getString("C_ADDRESS"));
				c.setMainImage(rs.getString("C_MAIN_IMAGE"));
				list.add(c);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}
}
