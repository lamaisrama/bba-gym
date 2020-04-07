package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;

import static com.bbagym.common.JDBCTemplate.close;


import java.sql.Connection;

import com.bbagym.dao.MemberDao;
import com.bbagym.model.vo.Member;

public class MemberService {
	
	private MemberDao dao = new MemberDao();
	
	
	public Member login(String id, String pw) {
		
		Connection conn = getConnection();
		Member m = dao.login(conn, id, pw);
		close(conn);
		return m;
	}


	public boolean userIdDuplicate(String id) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		boolean flag = dao.userIdDuplicate(conn, id);
		close(conn);

		return flag;
	}


	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = dao.insertMember(conn, m); 
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		rollback(conn);

		close(conn);
		return result;
	}


	public Member selectMemberId(String userId) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		Member m = dao.selectMemberId(conn, userId);
		close(conn);
		return m;
	}


	public int updateMember(Member m) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn,m);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}


	public int updatePassword(String id, String pw, String changePw) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		Member m = dao.login(conn,id,pw);
		
		
		int result=-1;
		if(m !=null) {
			result=dao.updatePassword(conn, id, changePw);
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
		}
		close(conn);
		return result;
	}

}
