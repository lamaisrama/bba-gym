package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bbagym.dao.CenterDao;
import com.bbagym.model.vo.Center;
import com.bbagym.model.vo.CenterEnroll;

public class CenterService {
	private CenterDao dao = new CenterDao();
	
	public List<CenterEnroll> centerView(int cPage, int numPerPage){
		Connection conn=getConnection();
		//데이터를 numPErPage 만큼 뽑아오는 method
		List<CenterEnroll> centerEnrollList = dao.centerView(conn, cPage, numPerPage);
		if(centerEnrollList.size()>0) {
			for(CenterEnroll c : centerEnrollList) {
				dao.findCategory(conn, c);
				dao.findFacility(conn, c);
			}
		}
		System.out.println(centerEnrollList);
		close(conn);
		return centerEnrollList;
	}
	
	public int selectCountCenter() {
		Connection conn = getConnection();
		int count = dao.selectCountCenter(conn);
		close(conn);
		return count;
	}
	
	public int enrollCenter(CenterEnroll c) {
		Connection conn = getConnection();
		int result=dao.enrollCenter(conn, c);
		if(result>0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
}
