package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bbagym.dao.MypageDao2;
import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Program;
import com.bbagym.model.vo.TrainerEnroll;
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
	
	public int deleteCenter(int cCode) {
		Connection conn = getConnection();
		//1. 해당 center 정보 select해옴
		CenterEnroll ce = dao.selectCenter(conn, cCode);
		if(ce==null) return 0;
		//2. old tbl로 데이터 이전
		int result=dao.shiftDeleteCenter(conn, ce);
		if(result>0) {
			//데이터 삭제
			result=dao.deleteCenter(conn,cCode);
			if(result>0) {
				commit(conn);
				close(conn);
				return 1;
			}else {
				rollback(conn);
				close(conn);
				return 0;
			}
		}else {
			rollback(conn);
			close(conn);
			return 0;
		}
		
	}
	
	public int deleteTrainer(int tCode) {
		Connection conn = getConnection();
		//1. 해당 center 정보 select해옴
		TrainerEnroll te = dao.selectTrainer(conn, tCode);
		if(te==null) return 0;
		//2. old tbl로 데이터 이전
		int result=dao.shiftDeleteTrainer(conn, te);
		if(result>0) {
			//데이터 삭제
			result=dao.deleteTrainer(conn,tCode);
			if(result>0) {
				commit(conn);
				close(conn);
				return 1;
			}else {
				rollback(conn);
				close(conn);
				return 0;
			}
		}else {
			rollback(conn);
			close(conn);
			return 0;
		}
		
	}

	public List<Program> selectProgram(int tCode) {
		Connection conn = getConnection();
		List<Program> programs = dao.selectProgram(conn, tCode);
		close(conn);
		return programs;
	}

	public int changeStatus(int pCode, String status) {
		Connection conn = getConnection();
		int result=dao.changeStatus(conn, pCode, status);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertOrderHistory(int mCode, String[] centerList, String[] trainerList) {
		Connection conn=getConnection();
		if(centerList!=null&&centerList.length>0) {
			for(String center : centerList ) {
				String[] info = center.split("/");
				String pCode = info[0];
				String month = info[1];
				int result=dao.insertCenterOrderHistory(conn, mCode, pCode, month);
				if(result==0) {
					rollback(conn);
					close(conn);
					return 0;
				}
				
			}
		}
		
		if(trainerList!=null&&trainerList.length>0) {
			for(String trainer : trainerList) {
				String[] info = trainer.split("/");
				String pCode = info[0];
				String count = info[1];
				int result=dao.insertTrainerOrderHistory(conn, mCode, pCode, count);
				if(result==0) {
					rollback(conn);
					close(conn);
					return 0;
				}
				
			}
		}
		commit(conn);
		close(conn);
		return 1;
		
	}
}
