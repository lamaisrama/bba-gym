package com.bbagym.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.Member;

/**
 * Servlet implementation class ShoppingBaguniDeleteServlet
 */
@WebServlet("/ShoppingBaguniDeleteServlet.do")
public class ShoppingBaguniDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingBaguniDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String mcode;
		try {
		mcode = String.valueOf(((Member)session.getAttribute("logginMember")).getM_CODE());
		}catch(NullPointerException e) {
			mcode="";
			request.setAttribute("msg", "로그인해주세요");
			request.setAttribute("loc", "");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		String value = request.getParameter("value");
		Cookie[] cookies = request.getCookies();
		System.out.println(mcode+"삭제");
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name=c.getName();
				String cvalue=c.getValue();
				if(name.equals(mcode)) {
					
					if(cvalue.indexOf(value)!=-1) {

						 cvalue=cvalue.replace(value+"&", "");
						 c= new Cookie(""+mcode, cvalue);
						 	if(!cvalue.equals("")) {
							c.setMaxAge(31*24*60*60);
						 	}else {
						 		c.setMaxAge(0);
						 	}
							response.addCookie(c);
						
					}
				
				}
			}
		}
		
		
		response.sendRedirect(request.getContextPath()+"/mypage/baguni.do");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
