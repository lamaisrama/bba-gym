package com.bbagym.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bbagym.model.vo.BuyInfo;
import com.bbagym.model.vo.Center;
import com.bbagym.model.vo.CenterDetail;
import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Comment;
import com.bbagym.model.vo.CommentScore;
import com.bbagym.model.vo.Trainer;
import com.bbagym.model.vo.TrainerDetail;
import com.bbagym.model.vo.TrainerProgram;
import com.bbagym.model.vo.TrainerView;

import static com.bbagym.common.JDBCTemplate.close;

public class TrainerDao {

	private Properties prop = new Properties();

	
	public TrainerDao() {
		// TODO Auto-generated constructor stub
		try {
			String path = TrainerDao.class.getResource("/sql/trainer/trainer_query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//모든 트레이너 데이터를 가져오는 dao 페이징처리
	public List<TrainerView> AllTrainerDataList(Connection conn,int cPage,int numPerpage){ 
		
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<TrainerView> list = new ArrayList<TrainerView>();
		String sql =prop.getProperty("AllTrainerDataList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TrainerView tv = new TrainerView();
				
				tv.setTcode(rs.getInt("t_code"));
				tv.setTimg(rs.getString("t_main_img"));
				tv.setMname(rs.getString("m_name"));
				tv.setCcenter(rs.getString("c_name"));
				tv.setMaddres2(rs.getString("m_address_2"));
				
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
	
	// list를 보내어  트레이너별 카테고리 다중값을 다시 넣어주는 dao
	public List<TrainerView> TrainerBadge(Connection conn,List<TrainerView> list){ 
		
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql =prop.getProperty("TrainerBadge");
		
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
	
	//모든 트레이너 데이터를 가져오는 dao 논페이징처리
	public int AllTrainerDataCount(Connection conn) { 
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result =0;
		String sql =prop.getProperty("AllTrainerDataCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);

			
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
	
	// 검색에 타입과 키워드에따라 트레이너 데이터를 가져오는 dao 페이징처리 (이름,소속)
	public List<TrainerView> searchTrainerData(Connection conn,int cPage,int numPerpage,String type,String searchKeyword){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<TrainerView> list = new ArrayList<TrainerView>();
		String sql =prop.getProperty("searchTrainerData");
		sql=sql.replace("type", type);
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKeyword+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TrainerView tv = new TrainerView();
				
				tv.setTcode(rs.getInt("t_code"));
				tv.setTimg(rs.getString("t_main_img"));
				tv.setMname(rs.getString("m_name"));
				tv.setCcenter(rs.getString("c_name"));
				tv.setMaddres2(rs.getString("m_address_2"));
				
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
	
	// 검색에 타입과 키워드에따라 트레이너 모든 데이터를 가져오는 dao 논페이징처리 (이름,소속)
	public int serachTrainerAllData(Connection conn, String type, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result =0;
		String sql =prop.getProperty("serachTrainerAllData");
		sql=sql.replace("type", type);
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKeyword+"%");
			
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
	
	// 검색에 타입과 키워드에따라 트레이너 데이터를 가져오는 dao 페이징처리 (카테고리)
	public List<TrainerView> searchTrainerData2(Connection conn,int cPage,int numPerpage,String searchKeyword){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<TrainerView> list = new ArrayList<TrainerView>();
		String sql =prop.getProperty("searchTrainerData2");

		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKeyword+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TrainerView tv = new TrainerView();
				
				tv.setTcode(rs.getInt("t_code"));
				tv.setTimg(rs.getString("t_main_img"));
				tv.setMname(rs.getString("m_name"));
				tv.setCcenter(rs.getString("c_name"));
				tv.setMaddres2(rs.getString("m_address_2"));
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
	
	// 검색에 타입과 키워드에따라 트레이너 모든 데이터를 가져오는 서비스 논페이징처리 (카테고리)
	public int serachTrainerAllData2(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result =0;
		String sql =prop.getProperty("serachTrainerAllData2");
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKeyword+"%");
			
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

	//ajax처리를 통해 트레이너 소속을 정하기 위해 센터코드,센터이름,주소를 가져오는 메소드
	public List<Center> searchCenterName(Connection conn,String name) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		List<Center> list = new ArrayList<Center>();
		String sql =prop.getProperty("searchCenterName");
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Center c = new Center();
				c.setcCode(rs.getInt("C_CODE"));
				c.setcName(rs.getString("C_NAME"));
				c.setcAddress(rs.getString("C_ADDRESS"));
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
	
	//카테고리 serach를 하기위한 dao 페이징처리
	public List<TrainerView> SearchCategoryPageData(Connection conn,int cPage,int numPerpage,String type){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<TrainerView> list= new ArrayList<TrainerView>();
		String sql =prop.getProperty("SearchCategoryPageData");
		sql=sql.replace("TYPE", type); // '1','2','3', ....
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TrainerView tv =new TrainerView();
				
				tv.setTcode(rs.getInt("t_code"));
				tv.setTimg(rs.getString("t_main_img"));
				tv.setMname(rs.getString("m_name"));
				tv.setCcenter(rs.getString("c_name"));
				tv.setMaddres2(rs.getString("m_address_2"));
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
	
	public int searchCategoryCountCenter(Connection conn ,String type) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql =prop.getProperty("searchCategoryCountCenter");
		sql=sql.replace("TYPE", type);
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
	
	public TrainerDetail trainerViewDetail(Connection conn, int t_code) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("trainerDetail");
		TrainerDetail td=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, t_code);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				td = new TrainerDetail();
				td.setProf_img(rs.getString("t_main_img"));
				td.setT_name(rs.getString("m_name"));
				td.setT_intro(rs.getString("t_introduction"));
				td.setM_phone_2(rs.getString("M_PHONE_2"));
				td.setM_address_2(rs.getString("M_ADDRESS_2"));
				td.setT_text(rs.getString("t_text"));
				td.setT_career(rs.getString("T_CAREER"));
				td.setT_counsel_hours(rs.getString("T_COUNSEL_HOURS"));
				td.setC_name(rs.getString("C_NAME"));
				td.setSns_homepage(rs.getString("SNS_HOMEPAGE"));
				td.setSns_instagram(rs.getString("SNS_INSTAGRAM"));
				td.setSns_blog(rs.getString("SNS_BLOG"));
				td.setSns_etc(rs.getString("SNS_ETC"));
				td.setcCode(rs.getInt("c_code"));
				System.out.println(td);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return td;
		
	}
	
	public void trainerViewDetailpNames(Connection conn, int t_code,TrainerDetail td) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		td.settProgramNames(new ArrayList());
		
		String sql = prop.getProperty("getProgramNames");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, t_code);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				td.gettProgramNames().add(rs.getString("P_NAME"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	}
	
	public void trainerViewDetailPrograms(Connection conn, int t_code,TrainerDetail td) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		td.setTrainerPrograms(new ArrayList());//리스트 초기값 세팅
		
		String sql = prop.getProperty("getTrainerProgramPrices");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, t_code);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				//List<String> temp=td.getT_program_name();
				TrainerProgram tp=new TrainerProgram();
				tp.setPcode(rs.getInt("p_code"));
				tp.setpName(rs.getString("p_name"));
				tp.setPrice(rs.getInt("price"));
				tp.setCount(rs.getInt("count"));
				td.getTrainerPrograms().add(tp);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	}
	
	public void trainerViewDetailImgs(Connection conn, int t_code, TrainerDetail td) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		td.setT_img(new ArrayList());
		
		String sql = prop.getProperty("getTrainerImgs");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, t_code);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				td.getT_img().add(rs.getString("t_image"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
	}
	
	public void getScoreForComment(Connection conn, TrainerDetail td, int tCode) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		td.setCommentScore(new ArrayList());
		
		String sql =prop.getProperty("getCommentScore");
		
		try {		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CommentScore cs = new CommentScore();
				cs.setCommentScore(rs.getInt("score"));
				System.out.println(cs);
				td.getCommentScore().add(cs);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	}
	
	public void getBuy(Connection conn,List<TrainerDetail> list, int tCode, int mCode, TrainerDetail td) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql =prop.getProperty("getBuy");
		
		try {		
			for(int i=0;i<list.size();i++) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mCode);
				pstmt.setInt(2, tCode); //센터에 있는 프로그램 중 하나라도 결제했는지 확인
				rs=pstmt.executeQuery();
				while(rs.next()) {
					if(rs.getInt(1)>0) { // 1이상이면 결제함(orderhistory에서 mcode갯수를 채크) 
						list.get(i).setBuy(true);
						td.setBuyCount(rs.getInt(1));
						
					}else {
						list.get(i).setBuy(false);
						td.setBuyCount(0);
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
	
	public void getBuyInfo(Connection conn, int tCode, int mCode, TrainerDetail td) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		td.setBuyInfo(new ArrayList());
		
		String sql =prop.getProperty("getBuyInfo");
		
		try {		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mCode);
			pstmt.setInt(2, tCode); //센터에 있는 프로그램 중 하나라도 결제했는지 확인
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BuyInfo bi = new BuyInfo();
				bi.setOrderCode(rs.getInt("ORDER_CODE"));
				bi.setmName(rs.getString("m_name"));
				bi.setpName(rs.getString("p_name"));
				bi.setCount(rs.getInt("count"));
				bi.setBuyDate(rs.getDate("ORDER_DATE"));
				bi.setScore(rs.getInt("score"));
				td.getBuyInfo().add(bi);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	}
	
	public List<Comment> selectComment(Connection conn, int tCode){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Comment> list = new ArrayList<Comment>();
		
		String sql = prop.getProperty("selectComment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, tCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Comment c = new Comment();
				c.setCommentCode(rs.getInt("t_comment_code"));
				c.setCommentLevel(rs.getInt("t_comment_level"));
				c.setmCode(rs.getInt("M_CODE"));
				c.setmName(rs.getString("M_NAME"));
				c.setCommentContent(rs.getString("t_comment_content"));
				c.settCode(rs.getInt("t_code"));
				c.setCommentRef(rs.getInt("t_comment_ref"));
				c.setCommentDate(rs.getDate("t_comment_date"));
				c.setOrderCode(rs.getInt("Order_code"));
				c.setpName(rs.getString("p_name"));
				c.setCount(rs.getInt("count"));
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
	
	public int insertComment(Connection conn, Comment c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCommentLevel());
			pstmt.setInt(2, c.getmCode());
			pstmt.setInt(3, c.gettCode());
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
	
	
}


