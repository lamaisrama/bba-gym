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
@WebServlet("/center/centerView.do")
public class CenterViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url= request.getContextPath()+"/center/centerView.do";
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
		
		//세션에 저장된 위 경도를 가지고옴
		//저장되어있지 않을 시, 기본 위치(KH강남1관)로 설정
		String lat="", lng="";
		if(session.getAttribute("user_lat")!=null&&session.getAttribute("user_lng")!=null) {
			lat = (String) session.getAttribute("user_lat");
			lng = (String) session.getAttribute("user_lng");
		}else {
			lat = "127.032848249971";
			lng = "37.4989966363357";
		}
		
		
		int numPerpage=3; //페이지당 3개 데이터 출력
		List<CenterEnroll> list = new CenterService().centerMainPageDataDistance(cPage,numPerpage,m, lat, lng);

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
