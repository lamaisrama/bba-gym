package com.bbagym.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.common.encrypt.AESEncrypt;
import com.bbagym.model.vo.Member;
import com.bbagym.service.MemberService;


/**
 * Servlet implementation class MemberEnrollModify
 */
@WebServlet("/member/memberEnrollView2.do")
public class MemberViewServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		//로그인이 된 사용자만 이용할 수 있게 
		HttpSession session=request.getSession();
	      if(session.getAttribute("logginMember")==null) {
	         request.setAttribute("msg", "잘못된 접근입니다.");
	         request.setAttribute("loc", "/");
	         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	      }
	      else {
	    	  String userId=request.getParameter("M_ID");
	    	  
	    	  Member m=new MemberService().selectMemberId(userId);
	    	 
	    	  AESEncrypt.decryptMember(m);
	    	  
	    	  request.setAttribute("member", m);
	    	  
		request.getRequestDispatcher("/views/member/memberEnrollView2.jsp").forward(request, response);
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
