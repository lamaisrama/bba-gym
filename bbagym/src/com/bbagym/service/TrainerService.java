package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.rollback;
import static com.bbagym.common.JDBCTemplate.commit;

import java.sql.Connection;
import java.util.List;

import com.bbagym.dao.TrainerDao;
import com.bbagym.model.vo.Trainer;

public class TrainerService {

	private static TrainerDao dao = new TrainerDao();
	
	public List<Trainer> AllTrainerDataList(int cPage,int numPerpage){
		Connection conn = getConnection();
		List<Trainer> list = dao.AllTrainerDataList(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public int AllTrainerDataCount() {
		return 0;
		
	}
}
