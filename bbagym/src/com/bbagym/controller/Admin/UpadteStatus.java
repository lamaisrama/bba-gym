package com.bbagym.controller.Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.service.AdminService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class UpadteApproval
 */
@WebServlet("/admin/updateaStatus")
public class UpadteStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpadteStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("도착");
		int userId=Integer.parseInt(request.getParameter("CODE"));
		 
		 int result=new AdminService().updateStatus(userId);
		 
		 System.out.println(result);
		 
		 String msg="";
			String loc="";


			if(result>0) {
				msg="지정한 멤버가 탈퇴처리되었습니다.";
				loc="/admin/memberlist.do";
			}else {
				msg="탈퇴실패";
				loc="/admin/memberlist.do";
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
