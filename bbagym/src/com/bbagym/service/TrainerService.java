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
			if(!list.isEmpty()) {
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
}
