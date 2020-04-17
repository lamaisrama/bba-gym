package com.bbagym.controller.Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.service.AdminService;

/**
 * Servlet implementation class NoApproval2
 */
@WebServlet("/admin/noApproval2")
public class NoApproval2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoApproval2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		 int c_code = Integer.parseInt(request.getParameter("CODE"));	
		 
		 int result=new AdminService().noApproval2(c_code);
		 
		 
		 String msg="";
			String loc="";


			if(result>0) {
				msg="트레이너 등록요청을 거절했습니다.";
				loc="/admin/trainerList.do";
			}else {
				msg="거절실패.";
				loc="/admin/trainerList.do";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
