package com.bbagym.controller.center;

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
		String keyword = request.getParameter("keyword").trim();
		String url= request.getContextPath()+"/center/search.do";
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
		int numPerpage=3;
		List<CenterEnroll> list = new CenterService().searchKeywordPageData(cPage,numPerpage,m,keyword);
		int totalData = new CenterService().searchCountCenter(keyword);
		
		String pageBar="";
		int pageBarSize=5;
		int totalPage = (int) Math.ceil((double)totalData/numPerpage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar += "<div><ul class='pagination'>";
//		search같은 경우는 type과 searchKeyword를 동봉해야하기떄문에 pageBar Template를 쓰지못함
		if(pageNo==1) {
			pageBar += "<li class='page-item'><a class='page-link'>[Frist]</a></li>";
		}else {
			pageBar +="<li class='page-item'><a class='page-link' href='"+url+"?cPage="+(pageNo-1)+"&keyword="+keyword+"'>[Previous]</a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar += "<li class='page-item'><a class='page-link'>"+pageNo+"</a></span>";
			}else {
				pageBar += "<li class='page-item'><a class='page-link'  href='"+url+"?cPage="+pageNo+"&keyword="+keyword+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<li class='page-item'><a class='page-link'>[End]</a></li>";
		}else {
			pageBar +="<li class='page-item'><a class='page-link'  href='"+url+"?cPage="+pageNo+"&keyword="+keyword+"'>[Next]</a></li>";
		}
		
		pageBar += "</ul></div>";

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
