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
@WebServlet(name="UpdatePasswordEndServlet",urlPatterns="/member/updatePasswordEnd")
public class UpdatePasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordEndServlet() {
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
		
		int result=new MemberService().updatePassword4(id,pw,changePw);
		System.out.println("id= "+id);
		System.out.println("pw= "+pw);
		System.out.println("result= "+result);
		String msg="";
		String loc="";
		String script="";
		if(result<0) {
			msg="현재비밀번호가 일치하지않습니다!";
			loc="/member/updatePassword.do?M_ID="+id;
		}else if(result>0) {
			//비밀번호 성공
			msg="비밀번호 변경성공";
			script="self.close();opener.location.replace('"+request.getContextPath()+"/member/logout.do');"+"self.close()";
		}else {
			//비밀번호 변경 실패
			msg="비밀번호 변경실패";
			loc="/member/updatePassword.do?M_ID="+id;
		
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
