package com.bbagym.controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.Member;
import com.bbagym.service.AdminService;

/**
 * Servlet implementation class AdminPasswordServlet
 */
@WebServlet("/admin/memberlist.do")
public class AdminMemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerPage=8;
		
		
		List<Member> list =new AdminService().selectMemberList(cPage,numPerPage);
		int totalData=new AdminService().selectCountMember();
		
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		if(pageNo==1) {
			pageBar+="<span>[이전]    </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/memberlist.do?cPage="+(pageNo-1)+"'>[이전]>&nbsp</a>";
			
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/admin/memberlist.do?cPage="+pageNo+"'&nbsp>&nbsp"+pageNo+"&nbsp&nbsp</a>";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar+="<span>   [다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/memberlist.do?cPage="+pageNo+"'>   [다음]</a>";  //pageNo+1 아님 하면 7나옴.
		}
		//pageBar 만들기 끝.!
		request.setAttribute("pageBar", pageBar);	
		
		request.setAttribute("members", list);

		request.getRequestDispatcher("/views/admin/Admin_member.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
