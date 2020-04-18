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

	public Member login2(String id) {
		Connection conn = getConnection();
		Member m= dao.login2(conn, id);
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

	public Member selectBusinessId(String userId) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		Member m = dao.selectBusinessId(conn, userId);
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
//business 회원정보 수정 
	public int updateBusiness(Member m) {
		Connection conn=getConnection();
		int result=dao.updateBusiness(conn,m);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public int updatePassword4(String id, String pw,String changePw) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		Member m = dao.login(conn,id,pw);
		
		int result=-1;
	
		System.out.println("m= "+m);
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



	public int updatePassword(String id, String pw,String changePw) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		Member m = dao.login2(conn,id);
		
		int result=-1;
	
		System.out.println("m= "+m);
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
	//pusth
	public int updatePassword1(String id, String pw, String changePw) {
		Connection conn=getConnection();
		Member m = dao.login(conn,id,pw);
	
		
		int result=-1;
		if(m !=null) {
			result=dao.updatePassword1(conn, id, changePw);
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
		}
		close(conn);
		return result;
	}



	public int insertBusiness(Member m) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = dao.insertBusiness(conn, m); 
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		rollback(conn);

		close(conn);
		return result;
	}


	public int memberDelete(String userId) {
		Connection conn=getConnection();
		int result=dao.memberDelete(conn,userId);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);

		return result;
	}

	public Member searchId(String name, String email) {
		
		Connection conn = getConnection();
		Member m = dao.searchId(conn, name, email);
		close(conn);
		return m;
	}

	public Member searchPW(String id, String name, String email) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		Member m = dao.searchPW(conn, id, name, email);
		close(conn);
		return m;
	}


	public String searchPW2(String id) {
		Connection conn = getConnection();
		String pw = dao.searchPW2(conn,id);
		close(conn);
		return pw;
	}
	


	

	

}
