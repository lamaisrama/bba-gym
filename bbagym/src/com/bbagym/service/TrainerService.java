package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.bbagym.dao.TrainerDao;
import com.bbagym.model.vo.TrainerView;

public class TrainerService {

	private static TrainerDao dao = new TrainerDao();
	
	public List<TrainerView> AllTrainerDataList(int cPage,int numPerpage){
		Connection conn = getConnection();
		List<TrainerView> list = dao.AllTrainerDataList(conn,cPage,numPerpage);
			if(!list.isEmpty()) { //리스트가 비어있지않으면 리스트내에 객체들에 다시 뱃지를 넣어주기 위해서  dao를 다시 방문한다
				list=dao.TrainerBadge(conn,list);
			}
		close(conn);
		return list;
	}
	
	public int AllTrainerDataCount() {
		Connection conn = getConnection();
		int result = dao.AllTrainerDataCount(conn);
		close(conn);
		return result;
		
	}
	
	public List<TrainerView> searchTrainerData(int cPage,int numPerpage,String type,String searchKeyword){
		Connection conn = getConnection();
		List<TrainerView> list = dao.searchTrainerData(conn,cPage,numPerpage,type,searchKeyword);
		if(!list.isEmpty()) {
			list=dao.TrainerBadge(conn,list);
		}
		close(conn);
		return list;
	}
	
	public int serachTrainerAllData(String type,String searchKeyword) {
		Connection conn = getConnection();
		int result = dao.serachTrainerAllData(conn,type,searchKeyword);
		close(conn);
		return result;
	}
	
	public List<TrainerView> searchTrainerData2(int cPage,int numPerpage,String searchKeyword){
		Connection conn = getConnection();
		List<TrainerView> list = dao.searchTrainerData2(conn,cPage,numPerpage,searchKeyword);
		if(!list.isEmpty()) { //리스트가 비어있지않으면 리스트내에 객체들에 다시 뱃지를 넣어주기 위해서  dao를 다시 방문한다
			list=dao.TrainerBadge(conn,list);
		}
		close(conn);
		return list;
	}
	
	public int serachTrainerAllData2(String searchKeyword) {
		Connection conn = getConnection();
		int result = dao.serachTrainerAllData2(conn,searchKeyword);
		close(conn);
		return result;
	}
	
	
}
