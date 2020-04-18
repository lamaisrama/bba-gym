package com.bbagym.controller.center;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.BuyInfo;
import com.bbagym.model.vo.CenterDetail;
import com.bbagym.model.vo.Comment;
import com.bbagym.model.vo.Member;
import com.bbagym.service.CenterService;

/**
 * Servlet implementation class CenterViewDetailServlet
 */
@WebServlet("/center/centerDetail.do")
public class CenterViewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterViewDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		
		int mCode;
		try {
			mCode = ((Member)session.getAttribute("logginMember")).getM_CODE();
			
		}catch(NullPointerException e) {
			mCode=0;
		}
			
			int cCode = Integer.parseInt(request.getParameter("cCode"));
			System.out.println(cCode);
			
			CenterDetail cd = new CenterService().centerViewDetail(cCode, mCode);
			List<Comment> comments = new CenterService().selectComment(cCode);
			
			System.out.println("center : "+cd);
			
			request.setAttribute("comments", comments);
			request.setAttribute("cCode", cCode);
			request.setAttribute("mCode", mCode);
			request.setAttribute("cd", cd);
			request.getRequestDispatcher("/views/center/centerViewDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
