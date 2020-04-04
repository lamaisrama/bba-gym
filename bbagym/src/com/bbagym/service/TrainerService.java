package com.bbagym.service;

import java.sql.Connection;
import java.util.List;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.rollback;
import static com.bbagym.common.JDBCTemplate.commit;

import com.bbagym.model.vo.Trainer;

public class TrainerService {

	private static TrainerDao dao = new TrainerDao();
	
	public List<Trainer> AllTrainerDataList(int cPage,int numPerpage){
		Connection conn = getConnection();
		List<Trainer> list = 
		return null;
		
	}
	
	public int AllTrainerDataCount() {
		return 0;
		
	}
}
