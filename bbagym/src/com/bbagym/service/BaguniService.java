package com.bbagym.service;

import java.sql.Connection;
import java.util.List;
import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;

import com.bbagym.dao.BaguniDao;
import com.bbagym.model.vo.Baguni;

public class BaguniService {

	private BaguniDao dao = new BaguniDao();
	
	public void searchtrainer(List<Baguni> trainerlist) {
		Connection conn = getConnection();
		dao.searchtrainer(conn,trainerlist);
		close(conn);
	}
	
	
	public void searchcenter(List<Baguni> centerlist) {
		Connection conn = getConnection();
		dao.searchcenter(conn,centerlist);
		close(conn);
	}
	
}
