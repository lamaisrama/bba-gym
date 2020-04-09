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
 * Servlet implementation class CenterSortCategoryServlet
 */
@WebServlet("/center/sortCategory.do")
public class CenterSortCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterSortCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String type = request.getParameter("type"); //cPage 1일때는 type이 존재하지않는다 null로 들어옴

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
		
		String keyword=request.getParameter("keyword").replace(" ", ""); // 검색키워드를 받아온다 공백처리
		String url= request.getContextPath()+"/center/sortCategory.do";
		
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
		
		List<CenterEnroll> list = new CenterService().SearchCategoryPageData(cPage,numPerpage,m,type,keyword);
	
		int totalData = new CenterService().searchCategoryCountCenter(type,keyword);
		String pageBar="";
		int pageBarSize=5;
		int totalPage = (int) Math.ceil((double)totalData/numPerpage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;

		if(type!=null) {
			type = type.replace("','", ".");
			type = type.replace("'","");
		} //type을 보낼때의 모습을 다시 replace정의후 보낸다

		pageBar += "<div><ul class='pagination'>";
		
		if(pageNo==1) {
			pageBar += "<li class='page-item'><a class='page-link'>[Frist]</a></li>";
		}else {
			pageBar +="<li class='page-item'><a class='page-link' href='"+url+"?cPage="+(pageNo-1)+"&keyword="+keyword+"&type="+type+"'>[Previous]</a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar += "<li class='page-item'><a class='page-link'>"+pageNo+"</a></span>";
			}else {
				pageBar += "<li class='page-item'><a class='page-link'  href='"+url+"?cPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<li class='page-item'><a class='page-link'>[End]</a></li>";
		}else {
			pageBar +="<li class='page-item'><a class='page-link'  href='"+url+"?cPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>[Next]</a></li>";
		}
		
		pageBar += "</ul></div>";

		request.setAttribute("pageBar", pageBar);
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
