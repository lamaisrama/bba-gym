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
		//1. center table에 값 넣기
		int result=dao.enrollCenter(conn, c);		
		if(result>0) {
			//2. DB에서 CCODE 가져오기
			c.setCode(dao.selectCcode(conn));
			System.out.println(c.getCode());
			//3. c_code 이용해서 c_category tbl에 insert
			result=dao.insertCenterCategory(conn, c);
			if(result>0) {
				//4. c_code 이용해서 center_facility tbl에 insert
				result=dao.insertCenterFacility(conn, c);
				if(result>0) {
					//5. c_code 이용해서 c_image 테이블에 이미지파일 path 저장
					result=dao.insertCenterImage(conn, c);
					if(result>0) {
						//6. c_code 이용해서 c_program 등록 & p_code 가져오기
						result=dao.insertProgram(conn,c);
						if(result>0) {
							int pCode=dao.selectPcode(conn);
							//7. p_code 이용해서 c_price 등록
							result=dao.insertProgramPrice(conn,pCode);
							if(result>0) {
								commit(conn);
								close(conn);
								return 1;
							}
						}
					}
				}
			}else {
				rollback(conn);
				close(conn);
				return -1;
			}
		}
	}
	
	//centerview에 보여줄 데이터를 가져오는 서비스
	public List<CenterEnroll> centerMainPageData(int cPage,int numPerpage,int mcode){
		Connection conn=getConnection();
		List<CenterEnroll> list =dao.centerMainPageData(conn,cPage,numPerpage); //기본 센터 정보를 가져오는 서비스
		if(!list.isEmpty()) {
			list = dao.findCatergoryList(conn,list); // 센터별 카테고리를 가져오는 서비스
			if(!list.isEmpty()&&mcode!=0) { //로그인상태이면서 위에서 오류가 뜨지않을경우 들어가게 로직
				list=dao.checkPerfer(conn,list,mcode); //로그인아이디에 찜인 상태인 센터를 표기하는 서비스
			}
		}
		close(conn);
		return list;
	}
	
	
}
