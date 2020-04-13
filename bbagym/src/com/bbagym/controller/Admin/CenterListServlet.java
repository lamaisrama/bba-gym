package com.bbagym.controller.Admin;

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
import com.bbagym.service.AdminService;
import com.bbagym.service.CenterService;

/**
 * Servlet implementation class CenterSearchServlet
 */
@WebServlet("/admin/centerList.do")
public class CenterListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
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
		int numPerpage=10;
		
		List<CenterEnroll> list = new AdminService().searchKeywordPageData(cPage,numPerpage,m);
		
		int totalData = new AdminService().searchCountCenter();
		
		String pageBar="";
		int pageBarSize=5;
		
		
		int totalPage = (int) Math.ceil((double)totalData/numPerpage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		//페이지바의 이미지는
		// [이전] 1 2 3 4 5 [다음]
		if(pageNo==1) {
			pageBar+="<span>[이전]    </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/centerList.do?cPage="+(pageNo-1)+"'>[이전]>&nbsp</a>";
			
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/admin/centerList.do?cPage="+pageNo+"'&nbsp>&nbsp"+pageNo+"&nbsp&nbsp</a>";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar+="<span>   [다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/admin/centerList.do?cPage="+pageNo+"'>   [다음]</a>";  //pageNo+1 아님 하면 7나옴.
		}
		//pageBar 만들기 끝.!

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("centerList", list);
		request.getRequestDispatcher("/views/admin/Admin_approveCenter.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
