package com.bbagym.controller.center;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.Member;
import com.bbagym.service.CenterService;
import com.google.gson.Gson;

/**
 * Servlet implementation class CenterPreferFindServlet
 */
@WebServlet("/center/centerPrefer.do")
public class CenterPreferFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterPreferFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int ccode = Integer.parseInt(request.getParameter("ccode"));
		
		HttpSession session = request.getSession();
		int mcode=((Member)session.getAttribute("logginMember")).getM_CODE();

			
		boolean flag = new CenterService().CenterPreferFind(ccode,mcode);
		
		new Gson().toJson(flag, response.getWriter());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
