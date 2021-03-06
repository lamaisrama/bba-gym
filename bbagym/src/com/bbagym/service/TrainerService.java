package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.bbagym.dao.TrainerDao;
import com.bbagym.model.vo.Center;
import com.bbagym.model.vo.Comment;
import com.bbagym.model.vo.TrainerDetail;
import com.bbagym.model.vo.TrainerView;

public class TrainerService {

	private static TrainerDao dao = new TrainerDao();
	
	 //모든 트레이너 데이터를 가져오는 서비스 페이징처리
	public List<TrainerView> AllTrainerDataList(int cPage,int numPerpage){
		Connection conn = getConnection();
		List<TrainerView> list = dao.AllTrainerDataList(conn,cPage,numPerpage);
			if(!list.isEmpty()) { //리스트가 비어있지않으면 리스트내에 객체들에 다시 뱃지를 넣어주기 위해서  dao를 다시 방문한다
				list=dao.TrainerBadge(conn,list);
			}
		close(conn);
		return list;
	}
	
	//모든 트레이너 데이터를 가져오는 서비스 논페이징처리
	public int AllTrainerDataCount() { 
		Connection conn = getConnection();
		int result = dao.AllTrainerDataCount(conn);
		close(conn);
		return result;
		
	}
	
	// 검색에 타입과 키워드에따라 트레이너 데이터를 가져오는 서비스 페이징처리 (이름,소속)
	public List<TrainerView> searchTrainerData(int cPage,int numPerpage,String type,String searchKeyword){ 
		Connection conn = getConnection();
		List<TrainerView> list = dao.searchTrainerData(conn,cPage,numPerpage,type,searchKeyword);
		if(!list.isEmpty()) { //리스트가 비어있지않으면 리스트내에 객체들에 다시 뱃지를 넣어주기 위해서  dao를 다시 방문한다
			list=dao.TrainerBadge(conn,list);
		}
		close(conn);
		return list;
	}
	
	// 검색에 타입과 키워드에따라 트레이너 모든 데이터를 가져오는 서비스 논페이징처리 (이름,소속)
	public int serachTrainerAllData(String type,String searchKeyword) { 
		Connection conn = getConnection();
		int result = dao.serachTrainerAllData(conn,type,searchKeyword);
		close(conn);
		return result;
	}
	
	// 검색에 타입과 키워드에따라 트레이너 데이터를 가져오는 서비스 페이징처리 (카테고리)
	public List<TrainerView> searchTrainerData2(int cPage,int numPerpage,String searchKeyword){ 
		Connection conn = getConnection();
		List<TrainerView> list = dao.searchTrainerData2(conn,cPage,numPerpage,searchKeyword);
		if(!list.isEmpty()) { //리스트가 비어있지않으면 리스트내에 객체들에 다시 뱃지를 넣어주기 위해서  dao를 다시 방문한다
			list=dao.TrainerBadge(conn,list);
		}
		close(conn);
		return list;
	}
	
	//카테고리 search를 하기 위한 서비스
	public List<TrainerView> SearchCategoryPageData(int cPage,int numPerpage,String type){
		Connection conn = getConnection();
		List<TrainerView> list = dao.SearchCategoryPageData(conn,cPage,numPerpage,type);
		if(!list.isEmpty()) { //리스트가 비어있지않으면 리스트내에 객체들에 다시 뱃지를 넣어주기 위해서  dao를 다시 방문한다
			list=dao.TrainerBadge(conn,list);
		}
		close(conn);
		return list;
	}
	
	//카테고리 search를 하기 위한 dao
	public int searchCategoryCountCenter(String type) {
		Connection conn =getConnection();
		int result = dao.searchCategoryCountCenter(conn,type);
		close(conn);
		return result;
	}



	public List<Center> searchCenterName(String address) {
		Connection conn = getConnection();
		List<Center> name = dao.searchCenterName(conn,address);
		close(conn);
		return name;
	}
	
	public TrainerDetail trainerViewDetail(int tCode, int mCode) {
		Connection conn = getConnection();
		TrainerDetail td = dao.trainerViewDetail(conn, tCode);
		if(td!=null) {
//			dao.trainerViewDetailpNames(conn, tCode, td);
			dao.trainerViewDetailPrograms(conn, tCode, td);
			dao.trainerViewDetailImgs(conn, tCode, td);
			List<TrainerDetail> list = new ArrayList<TrainerDetail>();
			list.add(td);
			 if(mCode!=0) { 
				dao.getScoreForComment(conn, td, tCode); 
			 	dao.getBuy(conn,list, tCode, mCode, td); 
			 	if(td.isBuy()==true) {
			 		System.out.println(td.isBuy()); 
			 		dao.getBuyInfo(conn, tCode, mCode, td); 
			 	} 
			 }
		}
		close(conn);
		return td;
	}
	
	public List<Comment> selectComment(int tCode){
		Connection conn = getConnection();
		List<Comment> c = dao.selectComment(conn, tCode);
		close(conn);
		return c;
	}
	
	public int insertComment(Comment c) {
		Connection conn=getConnection();
		int result = dao.insertComment(conn, c);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertScore(Comment c) {
		Connection conn=getConnection();
		int result1 = dao.insertScore(conn, c);
		if(result1>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result1;
	}
	

}
