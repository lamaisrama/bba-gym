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
 * Servlet implementation class CenterSearchServlet
 */
@WebServlet("/center/search.do")
public class CenterSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String keyword = request.getParameter("keyword").trim().replace(" ", "");
		String url= request.getContextPath()+"/center/search.do";
		String url2= "&keyword="+keyword;
		int cPage;
		int m;
		HttpSession session = request.getSession();
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			}catch(NumberFormatException e) {
				cPage=1;
			}
			
			try {
				
				m=((Member)session.getAttribute("logginMember")).getM_CODE();
			}catch(NullPointerException e) {
				m=0;
			} //로그인이면 m에 mcode를 가져오고 아니면 m=0으로 받는다
			
		int numPerpage=3;
		

		String lat="", lng="";
		if(session.getAttribute("user_lat")!=null&&session.getAttribute("user_lng")!=null) {
			lat = (String) session.getAttribute("user_lat");
			lng = (String) session.getAttribute("user_lng");
		}else {
			lat = "134.06688515940303";
			lng = "37.50133440959408";
		}
		List<CenterEnroll> list = new CenterService().searchKeywordPageData(cPage,numPerpage,m,keyword,lat,lng);
		int totalData = new CenterService().searchCountCenter(keyword);
		
		
		
		String pageBar = pageBar(url,url2, totalData, cPage, numPerpage); 

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("keyword",keyword);
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
