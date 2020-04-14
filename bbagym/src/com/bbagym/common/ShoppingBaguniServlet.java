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
 * Servlet implementation class ShoppingBaguniServlet
 */
@WebServlet("/ShoppingBaguniServlet.do")
public class ShoppingBaguniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingBaguniServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		int mcode =  ((Member)session.getAttribute("logginMember")).getM_CODE();

		String baguni = request.getParameter("baguni");
		System.out.println(baguni);
		
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			
			for(Cookie c : cookies) {
				String name=c.getName();
				String value=c.getValue();
				System.out.println(name);
				if(Integer.parseInt(c.getName())==mcode) {
					c= new Cookie(""+mcode, value+"|"+baguni+"|");
					c.setMaxAge(31*24*60*60);
					response.addCookie(c);
					return;
				}
			}
			Cookie c= new Cookie(""+mcode, "|"+baguni+"|");
			c= new Cookie(""+mcode, c.getValue()+"|"+baguni+"|");
			c.setMaxAge(31*24*60*60);
			response.addCookie(c);
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
