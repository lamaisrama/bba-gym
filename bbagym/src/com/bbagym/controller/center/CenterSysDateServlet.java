package com.bbagym.controller.center;

import static com.bbagym.common.PageBarTemplate.pageBar;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Member;
import com.bbagym.service.CenterService;

/**
 * Servlet implementation class CenterSysDateServlet
 */
@WebServlet("/center/sysdate.do")
public class CenterSysDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterSysDateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url= request.getContextPath()+"/center/sysdate.do";
		int cPage;
		int m;
		
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			}catch(NumberFormatException e) {
				cPage=1;
			}
			
			
			try {
				HttpSession session = request.getSession();
				m=((Member)session.getAttribute("logginMember")).getM_CODE();
			}catch(NullPointerException e) {
				m=0;
			}
			
		int numPerpage=3;
		
		List<CenterEnroll> list = new CenterService().sortSysDatePageData(cPage,numPerpage,m);
		int totalData = new CenterService().selectCountCenter();

		String pagebar = pageBar(url, totalData, cPage, numPerpage); 

		request.setAttribute("pageBar", pagebar);
		request.setAttribute("centerList", list);
		request.getRequestDispatcher("/views/center/centerView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
