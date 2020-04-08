package com.bbagym.controller.center;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.Member;

/**
 * Servlet implementation class CenterSortCategoryServlet
 */
@WebServlet("/center/sortCategory.do")
public class CenterSortCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterSortCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String[] category = request.getParameterValues("category");
		String url= request.getContextPath()+"/center/sortCategory.do";
		int cPage;
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		HttpSession session = request.getSession();
		int m;
		try {
			m=((Member)session.getAttribute("logginMember")).getM_CODE();
		}catch(NullPointerException e) {
			m=0;
		} //로그인이면 m에 mcode를 가져오고 아니면 m=0으로 받는다
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
