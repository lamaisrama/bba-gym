package com.bbagym.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.Member;
import com.bbagym.service.MemberService;

/**
 * Servlet implementation class SearchIdServlet
 */
@WebServlet("/member/searchId.do")
public class SearchIdServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String name=request.getParameter("M_NAME");
			String email=request.getParameter("M_EMAIL");
			Member m=new MemberService().searchId(name,email);
			
			if(m!=null) {
				HttpSession session=request.getSession();
							
				session.setAttribute("logginMember", m);
				
				request.getRequestDispatcher("/views/member/idpw_id.jsp").forward(request, response);
				
			}else {
				request.setAttribute("msg","입력한 정보가 맞지않습니다.다시 입력해 주세요.");
				request.setAttribute("loc", "/member/idpw.do");
				RequestDispatcher rd=request.getRequestDispatcher("/views/common/msg.jsp");
				rd.forward(request, response);
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
