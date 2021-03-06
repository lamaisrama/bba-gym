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
import java.util.Collection;
import java.util.List;
import java.util.Properties;

import com.bbagym.model.vo.BuyInfo;
import com.bbagym.model.vo.CenterDetail;
import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.CenterPrograms;
import com.bbagym.model.vo.Comment;
import com.bbagym.model.vo.CommentScore;

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
		List<CenterEnroll> list = new ArrayList<CenterEnroll>();
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
	
	//센터에서 탈퇴멤버가아니며 승인받은 센터의 갯수를 가져오는 메소드-bs
	public int selectCountCenter(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql = prop.getProperty("selectCountCenter");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next());
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
	

	//센터 리스트를 받아와 각 센터에 카테고리를 받아오는 메소드-bs
	public void findCatergoryList(Connection conn,List<CenterEnroll> list){
			
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql=prop.getProperty("FindCatergoryList");
			
			
			try {
				
				for(CenterEnroll c : list) {
					
				List<String> category=new ArrayList<String>();

				
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,c.getCode());
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					category.add(rs.getString("CATEGORY_NAME"));
				}
				

				c.setCategories(category);
				
				}
				
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
		}
	
	//centerview화면에 뿌려줄 center데이터를 담어오는 메소드 -bs
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
	
	//찜하기를 체크하는 dao 메소드-bs
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
		
		//센터 디테일용
		public void checkPerfer2(Connection conn,List<CenterDetail> list, int cCode, int mCode){
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			String sql =prop.getProperty("checkPerfer");
			
			try {
				
				for(int i=0;i<list.size();i++) {
					
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mCode);
				pstmt.setInt(2, cCode); //mcode와 code가 같은경우 count(*)를센다 즉 찜하기면 1 아니면 0 반환
				rs=pstmt.executeQuery();
				while(rs.next()) {
					if(rs.getInt(1)==1) { // 1일경우 찜하기이므로 boolean 형을 true로 변환
						list.get(i).setJjim(true);
					}else {
						list.get(i).setJjim(false);
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
			if(rs.next());
			cCode=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return cCode;

	}
	
	//찜하기 추가 또는 삭제 메소드 -bs
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
	

	public CenterDetail centerViewDetail(Connection conn, int cCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CenterDetail cd = null;
		
		String sql = prop.getProperty("centerDetail");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cCode);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cd= new CenterDetail();
				cd.setCenterMainImg(rs.getString("C_MAIN_IMAGE"));
				cd.setCenterName(rs.getString("C_NAME"));
				cd.setCenterAddr(rs.getString("C_ADDRESS"));
				cd.setCenterPhone(rs.getString("C_PHONE"));
				cd.setCenterIntro(rs.getString("C_TEXT"));
				cd.setCenterOpenHours(rs.getString("C_OPERATING_HOURS"));
				cd.setCenterHolidays(rs.getString("C_HOLIDAY"));
				cd.setCenterSchedule(rs.getString("C_SCHEDULE"));
				cd.setSns_homepage(rs.getString("SNS_HOMEPAGE"));
				cd.setSns_instagram(rs.getString("SNS_INSTAGRAM"));
				cd.setSns_blog(rs.getString("SNS_BLOG"));
				cd.setSns_etc(rs.getString("SNS_ETC"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return cd;
	}
	
	public void centerViewDetailPrograms(Connection conn, int cCode, CenterDetail cd) {
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		cd.setCenterPrograms(new ArrayList());
		
		String sql = prop.getProperty("getCenterPrograms");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cCode);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CenterPrograms cp = new CenterPrograms();
				cp.setpCode(rs.getInt("p_code"));
				cp.setpName(rs.getString("p_name"));
				cp.setPrice(rs.getInt("price"));
				cp.setMonth(rs.getInt("month"));
				cd.getCenterPrograms().add(cp);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	}
	
	public void centerViewDetailImgs(Connection conn, int cCode, CenterDetail cd) {
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		cd.setCenterImgs(new ArrayList());
		
		String sql = prop.getProperty("getCenterImgs");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cCode);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				cd.getCenterImgs().add(rs.getString("c_image"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	}
	
	public void centerViewDetailFacility(Connection conn, int cCode, CenterDetail cd) {
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		cd.setCenterFacilityNames(new ArrayList<String>());
		
		String sql = prop.getProperty("getCenterFacility");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cCode);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				cd.getCenterFacilityNames().add(rs.getString("f_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
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
	
	public void getScore1(Connection conn, int cCode, CenterDetail cd) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("getScore");
		try {
					
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cCode);
			
			rs=pstmt.executeQuery();
			if(rs.next());
			cd.setCenterScore(rs.getDouble(1));
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	//category and keyword serach한 데이터를 가져오는 dao-bs
	public List<CenterEnroll> SearchCategoryPageData(Connection conn,int cPage,int numPerpage,String keyword,String type){
		
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<CenterEnroll> list= new ArrayList<CenterEnroll>();
		String sql =prop.getProperty("SearchCategoryPageData");
		sql=sql.replace("TYPE", type); // '1','2','3', ....
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword.toUpperCase()+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
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
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}
	
	//category and keyword serach한 모든 데이터를 가져오는 dao-bs
	public int searchCategoryCountCenter(Connection conn,String keyword,String type) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql =prop.getProperty("searchCategoryCountCenter");
		sql=sql.replace("TYPE", type);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword.toUpperCase()+"%");
			rs=pstmt.executeQuery();
			if(rs.next());
			result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
		}
	
	//이름과주소를합쳐 serach한 데이터를 페이징처리하는 dao-bs
	public List<CenterEnroll> searchKeywordPageData(Connection conn,int cPage,int numPerpage,String keyword){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<CenterEnroll> list = new ArrayList<CenterEnroll>();
		String sql =prop.getProperty("searchKeywordPageData");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword.toUpperCase()+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
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
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
		
	}
	
	
	//주소와이름을 합쳐서 search한 데이터의 전체카운트 dao-bs
	public int searchCountCenter(Connection conn,String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql = prop.getProperty("searchCountCenter");
		System.out.println(sql);
		System.out.println(keyword.toUpperCase());
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword.toUpperCase()+"%");
			rs=pstmt.executeQuery();
			if(rs.next());
			result=rs.getInt(1);
			
			System.out.println(result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	//최신순으로 sort하는 데이터 페이징 dao-bs
	public List<CenterEnroll> sortSysDatePageData(Connection conn,int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<CenterEnroll> list = new ArrayList<CenterEnroll>();
		String sql =prop.getProperty("sortSysDatePageData");
		
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
				c.setEnrollDate(rs.getDate("C_ENROLLDATE"));
				list.add(c);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	//평점순으로 sort하는 데이터 페이징 dao-bs
	public List<CenterEnroll> centerScorePageData(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<CenterEnroll> list = new ArrayList<CenterEnroll>();
		String sql =prop.getProperty("centerScorePageData");
		
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
	//리뷰순으로 sort하는 데이터 페이징 dao-bs
		public List<CenterEnroll> centerReviewPageData(Connection conn,int cPage,int numPerpage){
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			List<CenterEnroll> list = new ArrayList<CenterEnroll>();
			String sql =prop.getProperty("centerReviewPageData");
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
		
		public void getBuy(Connection conn,List<CenterDetail> list, int cCode, int mCode, CenterDetail cd) {
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			String sql =prop.getProperty("getBuy");
			
			try {		
				for(int i=0;i<list.size();i++) {
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, mCode);
					pstmt.setInt(2, cCode); //센터에 있는 프로그램 중 하나라도 결제했는지 확인
					rs=pstmt.executeQuery();
					while(rs.next()) {
						if(rs.getInt(1)>0) { // 1이상이면 결제함(orderhistory에서 mcode갯수를 채크) 
							list.get(i).setBuy(true);
							cd.setBuyCount(rs.getInt(1));
							
						}else {
							list.get(i).setBuy(false);
							cd.setBuyCount(0);
						}
						
					}
					
					}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
		}
		
		public void getBuyInfo(Connection conn, int cCode, int mCode, CenterDetail cd) {
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			cd.setBuyInfo(new ArrayList());
			
			String sql =prop.getProperty("getBuyInfo");
			
			try {		
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mCode);
				pstmt.setInt(2, cCode); //센터에 있는 프로그램 중 하나라도 결제했는지 확인
				rs=pstmt.executeQuery();
				while(rs.next()) {
					BuyInfo bi = new BuyInfo();
					bi.setOrderCode(rs.getInt("ORDER_CODE"));
					bi.setmName(rs.getString("m_name"));
					bi.setpName(rs.getString("p_name"));
					bi.setMonth(rs.getInt("month"));
					bi.setBuyDate(rs.getDate("ORDER_DATE"));
					bi.setScore(rs.getInt("score"));
					cd.getBuyInfo().add(bi);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
		}
		
		public int insertComment(Connection conn, Comment c) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String sql = prop.getProperty("insertComment");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, c.getCommentLevel());
				pstmt.setInt(2, c.getmCode());
				pstmt.setInt(3, c.getcCode());
				pstmt.setString(4, c.getCommentRef()==0?null:String.valueOf(c.getCommentRef()));
				pstmt.setString(5, c.getCommentContent());
				pstmt.setInt(6, c.getOrderCode());
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}
		
		public int insertScore(Connection conn, Comment c) {
			PreparedStatement pstmt = null;
			int result1 = 0;
			
			String sql = prop.getProperty("insertScore");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, c.getOrderScore());
				pstmt.setInt(2, c.getOrderCode());
				result1=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result1;
		}
		
		public List<Comment> selectComment(Connection conn, int cCode){
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Comment> list = new ArrayList<Comment>();
			
			String sql = prop.getProperty("selectComment");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, cCode);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Comment c = new Comment();
					c.setCommentCode(rs.getInt("C_comment_code"));
					c.setCommentLevel(rs.getInt("C_comment_level"));
					c.setmCode(rs.getInt("M_CODE"));
					c.setmName(rs.getString("M_NAME"));
					c.setCommentContent(rs.getString("C_comment_content"));
					c.setcCode(rs.getInt("C_CODE"));
					c.setCommentRef(rs.getInt("C_comment_ref"));
					c.setCommentDate(rs.getDate("C_comment_date"));
					c.setOrderCode(rs.getInt("Order_code"));
					c.setpName(rs.getString("p_name"));
					c.setMonth(rs.getInt("month"));
					c.setmId(rs.getString("M_ID"));
					c.setOrderScore(rs.getInt("score"));
					c.setStatus(rs.getString("status").charAt(0));
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
		
		public void getScoreForComment(Connection conn, CenterDetail cd, int cCode) {
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			cd.setCommentScore(new ArrayList());
			
			String sql =prop.getProperty("getCommentScore");
			
			try {		
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cCode);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					CommentScore cs = new CommentScore();
					cs.setCommentScore(rs.getInt("score"));
					cd.getCommentScore().add(cs);
					
					
//					cd.getCommentScore().add(cs);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
		}

		public List<CenterEnroll> centerMainPageDataDistance(Connection conn, int cPage, int numPerpage, String lat,
				String lng) {
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			List<CenterEnroll> list = new ArrayList<CenterEnroll>();
			String sql =prop.getProperty("centerMainPageDataByDistance");
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, lat);
				pstmt.setString(2, lng);
				pstmt.setInt(3, ((cPage-1)*numPerpage+1));
				pstmt.setInt(4, cPage*numPerpage);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					CenterEnroll c =new CenterEnroll();
					c.setCode(rs.getInt("C_CODE"));
					c.setName(rs.getString("C_NAME"));
					c.setAddress(rs.getString("C_ADDRESS"));
					c.setMainImage(rs.getString("C_MAIN_IMAGE"));
					c.setDistance(String.valueOf(rs.getDouble("distance")));
					list.add(c);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			
			return list;
		}
		
		public void checkXY(Connection conn,List<CenterEnroll> list,String lat,String lng){
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			String sql =prop.getProperty("checkXY");
			try {
				
				for(CenterEnroll ce : list) {
					
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, lat);
				pstmt.setString(2, lng);
				pstmt.setInt(3, ce.getCode());
				rs=pstmt.executeQuery();
				
				if(rs.next());
				
				ce.setDistance(String.valueOf(rs.getDouble(1)));
				
				}
				
			
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			
			
		}

		public void centerLatLng(Connection conn, int cCode, CenterDetail cd) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql= prop.getProperty("selectXY");
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, cCode);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					cd.setAddrX(rs.getString("c_x"));
					cd.setAddrY(rs.getString("c_y"));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			
		}
		
	
}
