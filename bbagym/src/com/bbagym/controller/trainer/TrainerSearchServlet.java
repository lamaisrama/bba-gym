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
		int cPage;
		int totalData=0;
		List<TrainerView> list = new ArrayList<TrainerView>();
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerpage=9;
		
		if(!type.equals("category_name")) {
		 list = new TrainerService().searchTrainerData(cPage,numPerpage,type,searchKeyword);
		 totalData = new TrainerService().serachTrainerAllData(type,searchKeyword);
		}else {
			list = new TrainerService().searchTrainerData2(cPage,numPerpage,searchKeyword);
			totalData = new TrainerService().serachTrainerAllData2(searchKeyword);
		}
		
		String pageBar="";
		int pageBarSize=5;
		int totalPage = (int) Math.ceil((double)totalData/numPerpage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar += "<div><ul class='pagination'>";
		
		if(pageNo==1) {
			pageBar += "<li class='page-item'><a class='page-link'>[Frist]</a></li>";
		}else {
			pageBar +="<li class='page-item'><a class='page-link' href='"+url+"?cPage="+(pageNo-1)+"&type="+type+"&searchKeyword="+searchKeyword+"'>[Previous]</a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar += "<li class='page-item'><a class='page-link'>"+pageNo+"</a></span>";
			}else {
				pageBar += "<li class='page-item'><a class='page-link'  href='"+url+"?cPage="+pageNo+"&type="+type+"&searchKeyword="+searchKeyword+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<li class='page-item'><a class='page-link'>[End]</a></li>";
		}else {
			pageBar +="<li class='page-item'><a class='page-link'  href='"+url+"?cPage="+pageNo+"&type="+type+"&searchKeyword="+searchKeyword+"'>[Next]</a></li>";
		}
		
		pageBar += "</ul></div>";
		
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
