package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.bbagym.dao.TrainerEnrollDao;
import com.bbagym.model.vo.Program;
import com.bbagym.model.vo.TrainerEnroll;


public class TrainerService2 {
	private TrainerEnrollDao dao = new TrainerEnrollDao();

	public int enrollTrainer(TrainerEnroll te) {
		Connection conn = getConnection();
		//1. center table에 값 넣기
		int result=dao.enrollTrainer(conn, te);		
		if(result>0) {
			//2. DB에서 TCODE 가져오기
			te.setCode(dao.selectTcode(conn));
			//3. t_code 이용해서 t_category tbl에 insert
			result=dao.insertTrainerCategory(conn, te);
			if(result==te.getCategories().size()) {
				//5. t_code 이용해서 t_image 테이블에 이미지파일 path 저장
				result=dao.insertTrainerImage(conn, te);
				if(result==te.getPhotos().size()) {
					//6. t_code 이용해서 t_program 등록 
					result=dao.insertProgram(conn,te);
					if(result==te.getProgram().size()) {
						//6.1. p_code 가져오기
						int totalProgram = te.getProgram().size();
						int pCodeLast=dao.selectPcode(conn);
							//만약 프로그램 개수가 2개면, pCodeLast가 5일때  4,5이 들어간 것
						for(int i=totalProgram;i>0;i--) {
							te.getProgram().get(i-1).setpCode(pCodeLast);
							pCodeLast--;
						}
						//7. p_code 이용해서 c_price 등록
						for(Program p : te.getProgram()) {
							result=0;
							for(int i=0;i<4;i++) {
								result+=dao.insertProgramPrice(conn, p.getpCode(), p.getPrices().get(i));
							}
							if(result!=4) return -1;
						}
						result=1;
						if(result>0) {
							commit(conn);
							close(conn);
							return 1;
						}
					}
				}
			}
		}
		rollback(conn);
		close(conn);
		return -1;
	}
}
	
	
	

