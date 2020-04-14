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
import com.bbagym.model.vo.MypageUser;
import com.bbagym.service.MypageService;

/**
 * Servlet implementation class MypageUserServlet
 */
@WebServlet("/mypage/mypageUser.do")
public class MypageUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session  = request.getSession();
		
		int mcode = ((Member)session.getAttribute("logginMember")).getM_CODE();
		
		List<MypageUser> cmembership = new MypageService().findCenterData(mcode);
		List<MypageUser> tmembership = new MypageService().findTrainerData(mcode);
		List<MypageUser> myPerfer = new MypageService().findMyPerfer(mcode);
		
	
		request.setAttribute("cmembership", cmembership);
		request.setAttribute("tmembership", tmembership);
		request.setAttribute("myPerfer", myPerfer);
		request.getRequestDispatcher("/views/mypage/mypage-user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
