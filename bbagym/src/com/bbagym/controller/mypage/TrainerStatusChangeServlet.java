package com.bbagym.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.service.MyPageService2;

/**
 * Servlet implementation class TrainerStatusChangeServlet
 */
@WebServlet("/mypage/statusChange")
public class TrainerStatusChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerStatusChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pCode=Integer.parseInt(request.getParameter("pCode"));
		String status=request.getParameter("status");
		int result=new MyPageService2().changeStatus(pCode, status);
		String msg="";
		if(result>0) {
			msg="해당 프로그램의 상태 전환에 성공하였습니다.";
		}else {
			msg="상태 전환 실패. 관리자에게 문의하세요";
		}
		String loc="/mypage/mypageBusiness.do";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
