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
		boolean flag=false;
		String baguni = request.getParameter("baguni");
		System.out.println(baguni);
		
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			
			for(Cookie c : cookies) {
				String name=c.getName();
				String value=c.getValue();
				
				if(String.valueOf(mcode).equals(name)) {
					
					String[] check=value.split("&");
					
					for(String c1 : check) {
						if(c1.equals(baguni)) {
							return;
						}
					}
					
					c= new Cookie(""+mcode, value+baguni+"&");
					c.setMaxAge(31*24*60*60);
					response.addCookie(c);
					flag=true;
					break;
				}
				
			}
			
			
			if(flag==false) {
				Cookie c= new Cookie(""+mcode, baguni+"&");
				c.setMaxAge(31*24*60*60);
				response.addCookie(c);
			}
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
