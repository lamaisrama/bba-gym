package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.bbagym.dao.TrainerDao;
import com.bbagym.model.vo.Center;
import com.bbagym.model.vo.TrainerDetail;
import com.bbagym.model.vo.TrainerView;

public class TrainerService {

	private static TrainerDao dao = new TrainerDao();
	
	public List<TrainerView> AllTrainerDataList(int cPage,int numPerpage){ //모든 트레이너 데이터를 가져오는 서비스 페이징처리
		Connection conn = getConnection();
		List<TrainerView> list = dao.AllTrainerDataList(conn,cPage,numPerpage);
			if(!list.isEmpty()) { //리스트가 비어있지않으면 리스트내에 객체들에 다시 뱃지를 넣어주기 위해서  dao를 다시 방문한다
				list=dao.TrainerBadge(conn,list);
			}
		close(conn);
		return list;
	}
	
	public int AllTrainerDataCount() { //모든 트레이너 데이터를 가져오는 서비스 논페이징처리
		Connection conn = getConnection();
		int result = dao.AllTrainerDataCount(conn);
		close(conn);
		return result;
		
	}
	
	public List<TrainerView> searchTrainerData(int cPage,int numPerpage,String type,String searchKeyword){ // 검색에 타입과 키워드에따라 트레이너 데이터를 가져오는 서비스 페이징처리 (이름,소속)
		Connection conn = getConnection();
		List<TrainerView> list = dao.searchTrainerData(conn,cPage,numPerpage,type,searchKeyword);
		if(!list.isEmpty()) { //리스트가 비어있지않으면 리스트내에 객체들에 다시 뱃지를 넣어주기 위해서  dao를 다시 방문한다
			list=dao.TrainerBadge(conn,list);
		}
		close(conn);
		return list;
	}
	
	public int serachTrainerAllData(String type,String searchKeyword) { // 검색에 타입과 키워드에따라 트레이너 모든 데이터를 가져오는 서비스 논페이징처리 (이름,소속)
		Connection conn = getConnection();
		int result = dao.serachTrainerAllData(conn,type,searchKeyword);
		close(conn);
		return result;
	}
	
	public List<TrainerView> searchTrainerData2(int cPage,int numPerpage,String searchKeyword){ // 검색에 타입과 키워드에따라 트레이너 데이터를 가져오는 서비스 페이징처리 (카테고리)
		Connection conn = getConnection();
		List<TrainerView> list = dao.searchTrainerData2(conn,cPage,numPerpage,searchKeyword);
		if(!list.isEmpty()) { //리스트가 비어있지않으면 리스트내에 객체들에 다시 뱃지를 넣어주기 위해서  dao를 다시 방문한다
			list=dao.TrainerBadge(conn,list);
		}
		close(conn);
		return list;
	}
	
	public int serachTrainerAllData2(String searchKeyword) { // 검색에 타입과 키워드에따라 트레이너 모든 데이터를 가져오는 서비스 논페이징처리 (카테고리)
		Connection conn = getConnection();
		int result = dao.serachTrainerAllData2(conn,searchKeyword);
		close(conn);
		return result;
	}
	


	public List<Center> searchCenterName(String address) {
		Connection conn = getConnection();
		List<Center> name = dao.searchCenterName(conn,address);
		close(conn);
		return name;
	}
	
	public TrainerDetail trainerViewDetail(int t_code) {
		Connection conn = getConnection();
		TrainerDetail td = dao.trainerViewDetail(conn, t_code);
		if(td!=null) {
			dao.trainerViewDetailPrograms(conn, t_code, td);
			dao.trainerViewDetailImgs(conn, t_code, td);
		}
		System.out.println(td);
		close(conn);
		return td;
	}

	

}
