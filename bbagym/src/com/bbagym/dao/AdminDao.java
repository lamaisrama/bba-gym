package com.bbagym.dao;

import static com.bbagym.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Properties;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;

import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Member;
import com.bbagym.common.encrypt.AESEncrypt;
import com.bbagym.model.vo.AdminTrainer;


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
	
	public List<AdminTrainer> searchTrainer(Connection conn, int cPage, int numPerpage) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<AdminTrainer> list = new ArrayList<AdminTrainer>();
		String sql =prop.getProperty("searchTrainer");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {   //M_ID,M_NAME,M_ADDRESS_2,M_PHONE_2,T_INTRODUCTION,APPROVAL
				AdminTrainer t =new AdminTrainer();
				t.setM_ID(rs.getString("M_ID"));
				t.setM_NAME(rs.getString("M_NAME"));
				t.setM_ADDRESS_2(rs.getString("M_ADDRESS_2"));
				t.setM_PHONE_2(rs.getString("M_PHONE_2"));
				t.setT_INTRODUCTION(rs.getString("T_INTRODUCTION"));
				t.setAPPROVAL(rs.getString("APPROVAL"));
				t.setC_NAME(rs.getString("C_NAME"));
				t.setC_CODE(rs.getString("C_CODE"));
				list.add(t);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
		
	}
	public int searchCountTrainer(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select문을 썻으면 rs가 필요함.
		int result = 0;
		String sql = prop.getProperty("selectCountTrainer");
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

	
	
	
	
	public int updateApproval(Connection conn, int c_code) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateApproval");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c_code);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int noApproval(Connection conn, int c_code) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("noApproval");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c_code);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public int updateApproval2(Connection conn, int c_code) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateApproval2");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c_code);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int noApproval2(Connection conn, int c_code) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("noApproval2");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c_code);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public int updateStatus(Connection conn, int userId) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateStatus");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}


	public List<Member> selectMemberList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;  //select문있으면 써야함.
		List<Member> list = new ArrayList();
		String sql = prop.getProperty("selectMemberList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member b = new Member();
				b.setM_CODE(rs.getInt("M_CODE")); 
				b.setM_ID(rs.getString("M_ID"));
				b.setM_NAME(rs.getString("M_NAME"));
				b.setM_EMAIL(rs.getString("M_EMAIL"));
				
				b.setM_PHONE(AESEncrypt.decrypt(rs.getString("M_PHONE")));
				b.setM_ADDRESS(AESEncrypt.decrypt(rs.getString("M_ADDRESS")));
				
				
				b.setM_STATUS(rs.getString("M_STATUS").charAt(0));
				b.setM_GENDER(rs.getString("M_GENDER").charAt(0));
				b.setM_AGE(rs.getInt("M_AGE"));
				
				list.add(b); // row를 가져온다계속;
			}
		}catch(UnsupportedEncodingException e) {
			
		}catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return list; // ->서비스로
	}
	
	
	public int selectCountMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select문을 썻으면 rs가 필요함.
		int result = 0;
		String sql = prop.getProperty("selectCountMember");
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


