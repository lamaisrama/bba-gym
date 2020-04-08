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
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet",urlPatterns="/member/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("M_ID");
		String pw=request.getParameter("M_PW");
		
		Member m=new MemberService().login(id,pw);
		
		if(m!=null) {
			HttpSession session=request.getSession();
			
			session.setAttribute("logginMember", m);
			String saveId=request.getParameter("saveId");
			Cookie c=new Cookie("saveId",m.getM_ID());
			if(saveId!=null) {
				c.setMaxAge(3*24*60*60);
				response.addCookie(c);
			}else{
				c.setMaxAge(0) ;
			}    			
			    response.addCookie(c) ;
			    response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("msg","아이디나 비밀번호가 일치하지 않습니다");
			request.setAttribute("loc", "");
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
