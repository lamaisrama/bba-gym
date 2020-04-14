package com.bbagym.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.Member;
import com.bbagym.model.vo.TrainerView;
import com.bbagym.service.MyPageService2;

/**
 * Servlet implementation class MypageBusinessServlet
 */
@WebServlet("/mypage/mypageBusiness.do")
public class MypageBusinessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageBusinessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session  = request.getSession();
		int mCode = ((Member)session.getAttribute("logginMember")).getM_CODE();
		//시설 등록 현황 가져오기
		
		//트레이너 등록 현황 가져오기
		List<TrainerView> tv= new MyPageService2().findMyTrainer(mCode);
		for(int i=0;i<tv.size();i++){

			if(tv.get(i).getApproval()==null){
				tv.get(i).setApproval("진행 중");

			}else if(tv.get(i).getApproval().equals("Y")){
				tv.get(i).setApproval("승인");

			}else if(tv.get(i).getApproval().equals("N")) {
				tv.get(i).setApproval("거절");
			
			}
			
		}
		//Attribute에 저장
		//request.setAttribute("myCenter", cv);
		request.setAttribute("myTrainer", tv);
		request.getRequestDispatcher("/views/mypage/mypage-business.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
