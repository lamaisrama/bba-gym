package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.bbagym.dao.MypageDao2;
import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.TrainerView;

public class MyPageService2 {
	private MypageDao2 dao = new MypageDao2();
	
	public List<CenterEnroll> findMyCenter(int mCode){
		Connection conn = getConnection();
		List<CenterEnroll> list = dao.findMyCenter(conn, mCode);
		close(conn);
		return list;
		
	}
	
	public List<TrainerView> findMyTrainer(int mCode){
		Connection conn = getConnection();
		List<TrainerView> list=dao.findMyTrainer(conn,mCode);
		//유저아이디, 이름, 나이, 성별, 연락처, 등록종류, 등록일시, 상태
		if(!list.isEmpty()) { //리스트가 비어있지않으면 리스트내에 객체들에 다시 뱃지를 넣어주기 위해서  dao를 다시 방문한다
			list=dao.trainerBadge(conn,list);
		}
		close(conn);
		return list;
		
	}
	
	
}
