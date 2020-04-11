package com.bbagym.service;

import com.bbagym.dao.AdminDao;
import com.bbagym.model.vo.Center;
import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Member;
import java.sql.Connection;
import java.util.List;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;

import static com.bbagym.common.JDBCTemplate.close;
import com.bbagym.dao.MemberDao;

public class AdminService {

private AdminDao dao = new AdminDao();

public List<CenterEnroll> searchKeywordPageData(int cPage,int numPerpage,int mcode){
	Connection conn=getConnection();
	List<CenterEnroll> list =dao.searchKeywordPageData(conn,cPage,numPerpage); //기본 센터 정보를 가져오는 서비스
	
	close(conn);
	return list;
}
public int searchCountCenter() {
	Connection conn = getConnection();
	int count = dao.searchCountCenter(conn);
	close(conn);
	return count;
}
public int updateApproval(int c_code) {
	Connection conn=getConnection();
	int result=dao.updateApproval(conn,c_code);
	if (result > 0)
		commit(conn);
	else
		rollback(conn);
	close(conn);

	return result;
}



		
	


}
//pusth
