package com.bbagym.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.service.MemberService;

/**
 * Servlet implementation class UpdatePasswordEndServlet
 */
@WebServlet(name="UpdatePasswordEndServle2t",urlPatterns="/member/PasswordEnd")
public class UpdatePasswordEndServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordEndServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String id=request.getParameter("M_ID");
		String pw=request.getParameter("password");
		String changePw=request.getParameter("password_new");
		
		int result=new MemberService().updatePassword(id,pw,changePw);
		
		System.out.println(result);
		
		
		String msg="";
		String loc="";
		String script="";
		if(result>0) {
			//비밀번호 성공
			msg="비밀번호 변경성공";
			loc="/member/logoutgologin.do";
		}else {
			//비밀번호 변경 실패
			msg="비밀번호 변경실패";
			loc="/member/pw.do";
		
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("script", script);
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
