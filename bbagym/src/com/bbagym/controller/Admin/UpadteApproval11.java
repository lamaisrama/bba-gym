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
@WebServlet("/admin/updateaApproval11")
public class UpadteApproval11 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpadteApproval11() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 
		 
		 int result=new AdminService().updateApproval11();
		 
		 
		 String msg="";
			String loc="";


			if(result>0) {
				msg="[모든 시설] 등록요청을 승인했습니다.";
				loc="/admin/centerList.do";
			}else {
				msg="승인실패.";
				loc="/admin/centerList.do";
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
