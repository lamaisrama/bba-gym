package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bbagym.dao.AdminDao;
import com.bbagym.model.vo.AdminTrainer;
import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Member;

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

public List<AdminTrainer> searchTrainer(int cPage, int numPerpage, int m) {
	Connection conn=getConnection();
	List<AdminTrainer> list =dao.searchTrainer(conn,cPage,numPerpage); //기본 센터 정보를 가져오는 서비스
	
	close(conn);
	return list;
}



public int searchCountTrainer() {
	Connection conn = getConnection();
	int count = dao.searchCountTrainer(conn);
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
public int noApproval(int c_code) {
	Connection conn=getConnection();
	int result=dao.noApproval(conn,c_code);
	if (result > 0)
		commit(conn);
	else
		rollback(conn);
	close(conn);

	return result;
}

public int updateApproval2(int c_code) {
	Connection conn=getConnection();
	int result=dao.updateApproval2(conn,c_code);
	if (result > 0)
		commit(conn);
	else
		rollback(conn);
	close(conn);

	return result;
}

public List<Member> selectMemberList(int cPage, int numPerPage) {
	// TODO Auto-generated method stub
	Connection conn =getConnection();
	List<Member> list=dao.selectMemberList(conn,cPage,numPerPage);
	close(conn);
	
	return list;

}

public int selectCountMember() {
	Connection conn=getConnection();    
	int count=dao.selectCountMember(conn);
	close(conn);
	
	return count;
}

public int updateStatus(int userId) {
	Connection conn=getConnection();
	int result=dao.updateStatus(conn,userId);
	if (result > 0)
		commit(conn);
	else
		rollback(conn);
	close(conn);

	return result;
}














		
	


}
//pusth
