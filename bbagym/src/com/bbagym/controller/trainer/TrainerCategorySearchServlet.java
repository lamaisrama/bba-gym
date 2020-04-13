package com.bbagym.controller.trainer;

import static com.bbagym.common.PageBarTemplate.pageBar;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.TrainerView;
import com.bbagym.service.TrainerService;

/**
 * Servlet implementation class TrainerCategorySearchServlet
 */
@WebServlet("/trainer/trainercategory.do")
public class TrainerCategorySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerCategorySearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url= request.getContextPath()+"/trainer/trainercategory.do";
		String type = request.getParameter("type");
		int cPage;
		
			if(type==null) {
				
				String[] category = request.getParameterValues("category"); //cPage=1일때 checkbox에서 category를 받아온다 
				if(category!=null) {
					type="'"+String.join("','", category)+"'"; // sql문에 사용하기위한 형태로 type을 정의한다 '1','2' .....
				}else {
					type="''"; //카테고리 체크없이 넘길경우 공란을 넘긴다
			}
			 	
			}else {
				type="'"+type.replace(".", "','")+"'"; //cPage=2 부터는 type을 다시 replace로 '1','2' 모습으로 만든다
			}
		
			
			try {
					cPage = Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {
					cPage=1;
			}
		
		int numPerpage=9;
		
		List<TrainerView> list = new TrainerService().SearchCategoryPageData(cPage,numPerpage,type);
		int totalData = new TrainerService().searchCategoryCountCenter(type);
		
		if(type!=null) {
			type = type.replace("','", ".");
			type = type.replace("'","");
		} //type을 보낼때의 모습을 다시 replace정의후 보낸다
		
		String url2= "&type="+type;
		String pageBar = pageBar(url, url2,totalData, cPage, numPerpage); 

		System.out.println(type);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("type", type);
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
