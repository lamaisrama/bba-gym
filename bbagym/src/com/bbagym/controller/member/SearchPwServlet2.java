package com.bbagym.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.Member;
import com.bbagym.service.MemberService;

/**
 * Servlet implementation class SearchPwServlet1
 */
@WebServlet("/member/searchPw.do")
public class SearchPwServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("M_ID");
		String name=request.getParameter("M_NAME");
		String email=request.getParameter("M_EMAIL");
		System.out.println(id);
		System.out.println(name);
		System.out.println(email);
		Member m=new MemberService().searchPW(id,name,email);
		
		if(m!=null) {
			HttpSession session=request.getSession();
						
			session.setAttribute("logginMember", m);
			
			request.getRequestDispatcher("/views/member/idpw_pw.jsp?M_ID="+id).forward(request, response);
			
		}else {
			request.setAttribute("msg","입력한 정보가 맞지않습니다.다시 입력해 주세요.");
			request.setAttribute("loc", "/member/pw.do");
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
