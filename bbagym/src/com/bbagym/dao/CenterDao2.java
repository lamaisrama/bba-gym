package com.bbagym.dao;

import static com.bbagym.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Price;
import com.bbagym.model.vo.Program;

public class CenterDao2 {
	private Properties prop=new Properties();
	
	public CenterDao2() {
		try {
			String path=CenterDao2.class.getResource("/sql/center/center_query.properties").getPath();
			prop.load(new FileInputStream(path));
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
		//insert into center values(seq_c.nextval, ?, ?, ?, ?, ?, ?, ?, ?, null, ?, ?, ?, ?, ?);
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
	
	public int selectCountCenter(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql = "select count(*) from center";
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

	public int insertCenterCategory(Connection conn, CenterEnroll c) {
		PreparedStatement pstmt = null;
		String sql = "insert into c_category values(?, ?)";
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(2, c.getCode());
			List<String> categories = c.getCategories();
			for(String s : categories) {
				pstmt.setInt(1, Integer.parseInt(s));
				result+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertCenterFacility(Connection conn, CenterEnroll c) {
		PreparedStatement pstmt = null;
		String sql = "insert into center_facility values(?, ?)";
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCode());
			List<String> facilities = c.getFacilities();
			for(String s : facilities) {
				pstmt.setInt(2, Integer.parseInt(s));
				result+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertCenterImage(Connection conn, CenterEnroll c) {
		PreparedStatement pstmt = null;
		String sql = "insert into c_image values(?, ?)";
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCode());
			for(String s : c.getPhotos()) {
				pstmt.setString(2, s);
				result+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertProgram(Connection conn, CenterEnroll c) {
		PreparedStatement pstmt = null;
		String sql = "insert into c_program values(seq_c_prog.nextval, ?, ?)";
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			List<Program> programs= c.getProgram();
			for(Program p : programs) {
				pstmt.setString(1, p.getProgramName());
				pstmt.setInt(2, c.getCode());
				result+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int selectPcode(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int pCode=0;
		String sql = "SELECT SEQ_C_PROG.CURRVAL FROM DUAL";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			pCode=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return pCode;
	}

	public int insertProgramPrice(Connection conn, int pCode, Price price) {
		PreparedStatement pstmt = null;
		String sql = "insert into c_price values(?, ?, ?)";
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pCode);
			pstmt.setInt(2, price.getPrice());
			pstmt.setInt(3, price.getMonth());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}