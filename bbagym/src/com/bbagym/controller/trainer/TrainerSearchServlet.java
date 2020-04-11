
package com.bbagym.controller.trainer;

import static com.bbagym.common.PageBarTemplate.pageBar;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.common.PageBarTemplate;
import com.bbagym.model.vo.TrainerView;
import com.bbagym.service.TrainerService;

/**
 * Servlet implementation class TrainerSearchServlet
 */
@WebServlet("/trainer/trainerFind.do")
public class TrainerSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String type = request.getParameter("type");
		String searchKeyword=request.getParameter("searchKeyword").trim();
		String url= request.getContextPath()+"/trainer/trainerFind.do";
		String url2= "&type="+type+"&searchKeyword="+searchKeyword;
		int cPage;
		int totalData=0;
		List<TrainerView> list = new ArrayList<TrainerView>();
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerpage=9; //페이지당 9개의 데이터를 출력
		
		 list = new TrainerService().searchTrainerData(cPage,numPerpage,type,searchKeyword);
		 totalData = new TrainerService().serachTrainerAllData(type,searchKeyword);

			
		String pageBar = pageBar(url,url2, totalData, cPage, numPerpage); 
		
		 request.setAttribute("pageBar", pageBar);
		 request.setAttribute("type", type);
		 request.setAttribute("searchKeyword", searchKeyword);
		 request.setAttribute("trainerList", list);
		 request.getRequestDispatcher("/views/trainer/trainerView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
