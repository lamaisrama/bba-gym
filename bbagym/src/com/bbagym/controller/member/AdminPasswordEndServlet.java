package com.bbagym.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.common.filter.MyEncryptWrapper;
import com.bbagym.service.AdminService;
import com.bbagym.service.MemberService;

/**
 * Servlet implementation class AdminPasswordEndServlet
 */
@WebServlet(name="AdminPasswordEndServlet",urlPatterns="/admin/admInupdatePasswordEnd")
public class AdminPasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPasswordEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("M_ID");
		String pw=request.getParameter("password");
		String changePw=request.getParameter("password_new");
		int result=new MemberService().updatePassword1(id,pw,changePw);
		System.out.println("1"+id);
		System.out.println("2"+pw);
		System.out.println("3"+result);
		
		String msg="";
		String loc="";
		String script="";
		if(result<0) {
			msg="현재비밀번호가 일치하지않습니다!";
			loc="/admin/passwordModify.do?M_ID="+id;
			
		}else if(result>0) {
			//비밀번호 성공
			msg="비밀번호 변경성공";
			loc="/views/admin/Admin_Main.jsp";
		}else {
			//비밀번호 변경 실패
			msg="비밀번호 변경실패";
			loc="/admin/passwordModify.do?M_ID="+id;;
		
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
