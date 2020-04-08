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
		//c_name, c_addr, c_phone, c_ophr, c_holi, c_sch, c_text, c_main, m_code, ?, ?, ?, ?);
		//insert into center values(seq_c.nextval, ?, ?, ?, ?, ?, ?, ?, ?, 'N', ?, ?, ?, ?, ?);
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, c.getName()); pstmt.setString(2, c.getAddress()); 
			pstmt.setString(3, c.getTel()); pstmt.setString(4, c.getOpHr());
			pstmt.setString(5, c.getHoliday()); pstmt.setString(6, c.getSchedulePath());
			pstmt.setString(7, c.getText()); pstmt.setString(8, c.getMainImage());
			pstmt.setInt(9, c.getMemberCode()); pstmt.setString(10, c.getSnsHome());
			pstmt.setString(11, c.getSnsInsta()); pstmt.setString(12, c.getSnsBlog());
			pstmt.setString(13, c.getSnsEtc());
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
	

	//센터 리스트를 받아와 각 센터에 카테고리를 받아오는 메소드
		public void findCatergoryList(Connection conn,List<CenterEnroll> list){
			
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
			
		}
	
	//centerview화면에 뿌려줄 center데이터를 담어오는 메소드 
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
	
	//찜하기를 체크하는 dao 메소드
	public void checkPerfer(Connection conn,List<CenterEnroll> list,int mcode){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql =prop.getProperty("checkPerfer");
		
		try {
			
			for(int i=0;i<list.size();i++) {
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mcode);
			pstmt.setInt(2, list.get(i).getCode()); //mcode와 code가 같은경우 count(*)를센다 즉 찜하기면 1 아니면 0 반환
			rs=pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getInt(1)==1) { // 1일경우 찜하기이므로 boolean 형을 true로 변환
					list.get(i).setPrefer(true);
				}else {
					list.get(i).setPrefer(false);
				}
			}
			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		


	}
	
	public int selectCcode(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cCode=0;
		String sql = "SELECT SEQ_C.CURRVAL FROM DUAL";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			cCode=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return cCode;

	}
	
	public int insertDeletePerfer(Connection conn,int ccode,int mcode,boolean flag) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql="";
		if(flag) {
			 sql=prop.getProperty("DeletePrefer");
		}else {
			 sql=prop.getProperty("InsertPrefer");
		}
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, mcode);
			pstmt.setInt(2, ccode);
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public void getScore(Connection conn,List<CenterEnroll> list) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("getScore");
		try {
			
			for(CenterEnroll c: list) {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCode());
			
			rs=pstmt.executeQuery();
			
			rs.next();
			c.setScore(rs.getDouble(1));
			
			
			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
