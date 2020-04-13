package com.bbagym.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.service.MemberService;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/member/memberDelete.do")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		System.out.println("도착");
		String userId=request.getParameter("M_ID");
		
		int result=new MemberService().memberDelete(userId);
		
		String msg="";
		String loc="";

		
		if(result>0) {
			msg="회원탈퇴 성공";
			loc="/member/logout.do";
		}else {
			msg="회원탈퇴 실패";
			loc="/mypage/mypageUser.do?M_ID="+userId;
		}
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
