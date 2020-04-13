package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.bbagym.dao.CenterDao;
import com.bbagym.dao.CenterEnrollDao;
import com.bbagym.model.vo.CenterDetail;
import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Program;

public class CenterService {
	private static CenterDao dao = new CenterDao();
	private CenterEnrollDao enrollDao;
	
	//service에서 사용하는 폼 메소드형식
	public static void serivceForm(Connection conn,List<CenterEnroll> list,int mcode) {
		dao.findCatergoryList(conn,list); // 센터별 카테고리를 가져오는 서비스
		dao.getScore(conn,list); //센터별 별점을 가져오는 서비스
		if(mcode!=0) {
			dao.checkPerfer(conn,list,mcode); //로그인아이디에 찜인 상태인 센터를 표기하는 서비스
		}
	}
	
	public List<CenterEnroll> centerView(int cPage, int numPerPage){
		Connection conn=getConnection();//데이터를 numPErPage 만큼 뽑아오는 method
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
	
	//센터에서 탈퇴멤버가아니며 승인받은 센터의 갯수를 가져오는 서비스-bs
	public int selectCountCenter() {
		Connection conn = getConnection();
		int count = dao.selectCountCenter(conn);
		close(conn);
		return count;
	}
	
	
	//centerview에 보여줄 데이터를 가져오는 서비스-bs
	public List<CenterEnroll> centerMainPageData(int cPage,int numPerpage,int mcode){
		Connection conn=getConnection();
		List<CenterEnroll> list =dao.centerMainPageData(conn,cPage,numPerpage); //기본 센터 정보를 가져오는 서비스
		if(!list.isEmpty()) {
			serivceForm(conn,list,mcode);
		}
		close(conn);
		return list;
	}
	
	//ajax 찜하기 추가 또는 삭제 서비스 -bs
	public boolean CenterPreferFind(int ccode,int mcode) {
		Connection conn = getConnection();
		List<CenterEnroll> boguni = new ArrayList<CenterEnroll>();
		CenterEnroll c = new CenterEnroll();
		c.setCode(ccode);boguni.add(c);dao.checkPerfer(conn,boguni,mcode);//객체를 리스트에 담아서 찜하기 여부를 체크해옴
		boolean flag = boguni.get(0).getPrefer();	
		
		if(flag) { //찜하기 체크 여부에 따라 분기
			  int result=dao.insertDeletePerfer(conn,ccode,mcode,flag); // flag가 true이면 찜이 되있는것으로 삭제를하고 false를보낸다
			  	if(result>0) {
				  commit(conn); 
				} else{ 
				  rollback(conn); 
				} 
			  	close(conn);
				return false; 
		  }else {
			  int result=dao.insertDeletePerfer(conn,ccode,mcode,flag); // flag가 false이면 찜을하고 true를 보낸다
			  if(result>0) {
				  commit(conn); 
				} else{ 
				  rollback(conn); 
				} 
			    close(conn);
				return true; 
		  }
		
	}
	

	public CenterDetail centerViewDetail(int cCode, int mCode) {
		Connection conn = getConnection();
		CenterDetail cd = dao.centerViewDetail(conn, cCode);
		
		if(cd!=null) {
			dao.centerViewDetailPrograms(conn, cCode, cd);
			dao.centerViewDetailImgs(conn, cCode, cd);
			dao.centerViewDetailFacility(conn, cCode, cd);
			dao.getScore1(conn, cCode, cd);
			List<CenterDetail> list = new ArrayList<CenterDetail>();
			list.add(cd);
			if(mCode!=0) {
				dao.checkPerfer2(conn, list, cCode, mCode);				
			}
		}
		System.out.println(cd);
		close(conn);
		return cd;
	}

	//category and keyword serach한 데이터를 가져오는 서비스-bs
	public List<CenterEnroll> SearchCategoryPageData(int cPage,int numPerpage,int mcode,String type,String keyword){
		Connection conn=getConnection();
		List<CenterEnroll> list=dao.SearchCategoryPageData(conn,cPage,numPerpage,keyword,type); //cateogry and keyword 정렬 센터 정보를 가져오는 서비스
		if(!list.isEmpty()) {
			serivceForm(conn,list,mcode);
		}
		close(conn);
		return list;
	}
	
	//category and keyword serach한 모든 데이터를 가져오는 서비스-bs
	public int searchCategoryCountCenter(String type,String keyword) {
		Connection conn =getConnection();
		int result = dao.searchCategoryCountCenter(conn,keyword,type);
		close(conn);
		return result;
	}
	
	//이름과주소를합쳐 serach한 데이터를 페이징처리하는 서비스-bs
	public List<CenterEnroll> searchKeywordPageData(int cPage,int numPerpage,int mcode,String keyword){
		Connection conn=getConnection();
		List<CenterEnroll> list =dao.searchKeywordPageData(conn,cPage,numPerpage,keyword); //기본 센터 정보를 가져오는 서비스
		if(!list.isEmpty()) {
			serivceForm(conn,list,mcode);
		}
		close(conn);
		return list;
	}
	
	//주소와이름을 합쳐서 search한 데이터의 전체카운트 서비스-bs
	public int searchCountCenter(String keyword) {
		Connection conn = getConnection();
		int count = dao.searchCountCenter(conn,keyword);
		close(conn);
		return count;
	}
	
	//최신순으로 sort하는 데이터 페이징 서비스
	public List<CenterEnroll> sortSysDatePageData(int cPage,int numPerpage, int mcode){
		Connection conn=getConnection();
		List<CenterEnroll> list =dao.sortSysDatePageData(conn,cPage,numPerpage); //최신순 정보를 가져오는 서비스
		if(!list.isEmpty()) {
			serivceForm(conn,list,mcode);
		}
		close(conn);
		return list;
	}
	
	//평점순으로 sort하는 데이터 페이징 서비스
	public List<CenterEnroll> centerScorePageData(int cPage,int numPerpage, int mcode ){
		Connection conn=getConnection();
		List<CenterEnroll> list =dao.centerScorePageData(conn,cPage,numPerpage); //평점순 정보를 가져오는 서비스
		if(!list.isEmpty()) {
			serivceForm(conn,list,mcode);
		}
		close(conn);
		return list;
	}
	
	//리뷰순으로 sort하는 데이터 페이징 서비스
	public List<CenterEnroll> centerReviewPageData(int cPage,int numPerpage, int mcode ){
		Connection conn=getConnection();
		List<CenterEnroll> list =dao.centerReviewPageData(conn,cPage,numPerpage); //평점순 정보를 가져오는 서비스
		if(!list.isEmpty()) {
			serivceForm(conn,list,mcode);
		}

		close(conn);
		return list;
	}

		
	//현재 접속 위치 기반으로 시설 전체보기를 list up 하는 서비스 
		public List<CenterEnroll> centerMainPageDataDistance(int cPage, 
				int numPerpage, int mcode, String lat, String lng) {
			Connection conn=getConnection();
			List<CenterEnroll> list =dao.centerMainPageDataDistance(conn,cPage,numPerpage, lat, lng); //기본 센터 정보를 가져오는 서비스
			if(!list.isEmpty()) {
				serivceForm(conn,list,mcode);
			}
			close(conn);
			return list;
		}

	//센터 등록
	public int enrollCenter(CenterEnroll c) {
		enrollDao = new CenterEnrollDao();
		Connection conn = getConnection();
		//1. center table에 값 넣기
		int result=enrollDao.enrollCenter(conn, c);
		if(result>0) {
			//2. DB에서 CCODE 가져오기
			c.setCode(enrollDao.selectCcode(conn));
			//2-5 c_code 이용해서 centerxy에 좌표 넣기
			result=enrollDao.insertCenterXY(conn, c);
			if(result>0) {
				result=enrollDao.insertCenterCategory(conn, c);
				if(result==c.getCategories().size()) {
					//4. c_code 이용해서 center_facility tbl에 insert
					result=enrollDao.insertCenterFacility(conn, c);
					if(result==c.getFacilities().size()) {
						//5. c_code 이용해서 c_image 테이블에 이미지파일 path 저장
						result=enrollDao.insertCenterImage(conn, c);
						if(result==c.getPhotos().size()) {
							//6. c_code 이용해서 c_program 등록 
							result=enrollDao.insertProgram(conn,c);
							if(result==c.getProgram().size()) {
								//6.1. p_code 가져오기
								int totalProgram = c.getProgram().size();
								int pCodeLast=enrollDao.selectPcode(conn);
									//만약 프로그램 개수가 2개면, pCodeLast가 5일때  4,5이 들어간 것
								for(int i=totalProgram;i>0;i--) {
									c.getProgram().get(i-1).setpCode(pCodeLast);
									pCodeLast--;
								}
								//7. p_code 이용해서 c_price 등록
								for(Program p : c.getProgram()) {
									result=0;
									for(int i=0;i<4;i++) {
										result+=enrollDao.insertProgramPrice(conn, p.getpCode(), p.getPrices().get(i));
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
		}
		rollback(conn);
		close(conn);
		return -1;
	}
	
	
}
