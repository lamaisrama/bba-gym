package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bbagym.dao.CenterEnrollDao;
import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Program;

public class CenterService2 {
	private CenterEnrollDao dao = new CenterEnrollDao();
	
	
	public int enrollCenter(CenterEnroll c) {
		Connection conn = getConnection();
		//1. center table에 값 넣기
		int result=dao.enrollCenter(conn, c);		
		if(result>0) {
			//2. DB에서 CCODE 가져오기
			c.setCode(dao.selectCcode(conn));
			//3. c_code 이용해서 c_category tbl에 insert
			result=dao.insertCenterCategory(conn, c);
			if(result==c.getCategories().size()) {
				//4. c_code 이용해서 center_facility tbl에 insert
				result=dao.insertCenterFacility(conn, c);
				if(result==c.getFacilities().size()) {
					//5. c_code 이용해서 c_image 테이블에 이미지파일 path 저장
					result=dao.insertCenterImage(conn, c);
					System.out.println("이미지에 넣었는 지"+result);
					if(result==c.getPhotos().size()) {
						//6. c_code 이용해서 c_program 등록 
						result=dao.insertProgram(conn,c);
						if(result==c.getProgram().size()) {
							//6.1. p_code 가져오기
							int totalProgram = c.getProgram().size();
							int pCodeLast=dao.selectPcode(conn);
								//만약 프로그램 개수가 2개면, pCodeLast가 5일때  4,5이 들어간 것
							for(int i=totalProgram;i>0;i--) {
								c.getProgram().get(i-1).setpCode(pCodeLast);
								pCodeLast--;
							}
							//7. p_code 이용해서 c_price 등록
							for(Program p : c.getProgram()) {
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
		}
		rollback(conn);
		close(conn);
		return -1;
	}
}
