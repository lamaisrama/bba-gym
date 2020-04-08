package com.bbagym.controller.trainer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.TrainerEnroll;

/**
 * Servlet implementation class TrainerEnrollServletEnd
 */
@WebServlet("/trainer/trainerEnrollFirst")
public class TrainerEnrollFirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerEnrollFirstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TrainerEnroll te = new TrainerEnroll();
		te.setMemberCode(Integer.parseInt(request.getParameter("m-code")));
		te.setCenterCode(Integer.parseInt(request.getParameter("c_code")));
		te.setCounselHr(request.getParameter("t-counsel"));
		String[] cat= request.getParameterValues("t-cat");
		te.setCategories(new ArrayList());
		if(cat!=null){
			for(String s : cat) {
				te.getCategories().add(s);
			}
		}
		te.setSnsHome(request.getParameter("sns-homepage"));
		te.setSnsInsta(request.getParameter("sns-insta"));
		te.setSnsBlog(request.getParameter("sns-blog"));
		te.setSnsEtc(request.getParameter("sns-etc"));
		HttpSession session=request.getSession();
		session.setAttribute("trainerEnroll", te);
		request.getRequestDispatcher("/views/trainer/trainerEnroll-2.jsp").forward(request, response);
  	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
