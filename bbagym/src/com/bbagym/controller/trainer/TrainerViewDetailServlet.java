package com.bbagym.controller.trainer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.Comment;
import com.bbagym.model.vo.Member;
import com.bbagym.model.vo.TrainerDetail;
import com.bbagym.service.CenterService;
import com.bbagym.service.TrainerService;

/**
 * Servlet implementation class TrainerViewDetailServlet
 */
@WebServlet("/trainer/trainerDetail.do")
public class TrainerViewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerViewDetailServlet() {
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
		
		int tCode = Integer.parseInt(request.getParameter("tCode")); //TrainerView에서 받아와야 함
//		int t_code = 1;
		TrainerDetail td = new TrainerService().trainerViewDetail(tCode, mCode);
		
		List<Comment> comments = new TrainerService().selectComment(tCode);
		
		System.out.println("Comments 객체 : "+comments);
		
		request.setAttribute("comments", comments);
		request.setAttribute("tCode", tCode);
		request.setAttribute("mCode", mCode);
		request.setAttribute("td", td);
		request.getRequestDispatcher("/views/trainer/trainerViewDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
