package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.bbagym.dao.MypageDao;
import com.bbagym.model.vo.Member;
import com.bbagym.model.vo.MypageUser;

public class MypageService {

	private MypageDao dao = new MypageDao();
	
	public List<MypageUser> findCenterData(int mcode){
		Connection conn = getConnection();
		List<MypageUser> list = dao.findCenterData(conn,mcode);
		close(conn);
		return list;
	}
	
	public List<MypageUser> findTrainerData(int mcode){
		Connection conn = getConnection();
		List<MypageUser> list = dao.findTrainerData(conn,mcode);
		close(conn);
		return list;
	}
	
	
	public List<MypageUser> findMyPerfer(int mcode){
		Connection conn = getConnection();
		List<MypageUser> list = dao.findMyPerfer(conn,mcode);
		
		for(MypageUser my : list){
			System.out.println(my);
		}
		
		if(!list.isEmpty()) {
			dao.getScore(conn,list);
		}
		close(conn);
		return list;
	}
	
	public Member getUpdateInfo(int mCode) {
		Connection conn = getConnection();
		Member m = dao.getUpdateInfo(conn, mCode);
		
		close(conn);
		return m;
	}
	
}
