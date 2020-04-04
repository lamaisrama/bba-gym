package com.bbagym.controller.trainer;

import static com.bbagym.common.PageBarTemplate.pageBar;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.Trainer;
import com.bbagym.service.TrainerService;

/**
 * Servlet implementation class TrainerViewServlet
 */
@WebServlet("/trainer/trainerView.do")
public class TrainerViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url= request.getContextPath()+"/trainer/trainerView.do";
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerpage=5;
		List<Trainer> list = new TrainerService().AllTrainerDataList(cPage,numPerpage);
		int totalData = new TrainerService().AllTrainerDataCount();
		
		String pagebar = pageBar(url, totalData, cPage, numPerpage);
		request.setAttribute("pageBar", pagebar);
		request.setAttribute("trainerList", list);
		request.getRequestDispatcher("/views/trainner/trainnerView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
