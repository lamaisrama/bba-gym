package com.bbagym.controller.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class TrainerEnrollServletEnd
 */
@WebServlet("/trainer/enrollend1")
public class TrainerEnrollServletEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerEnrollServletEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된접근입니다");
			request.setAttribute("loc", "/trainer/trainerEnroll.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path=getServletContext().getRealPath("/upload/tariner/");
		int maxsize=1024*1024*100;
		
		MultipartRequest mr = new MultipartRequest(request,path,maxsize,"utf-8",new DefaultFileRenamePolicy()); 
		String t_name=mr.getParameter("t_name");
		String c_address=mr.getParameter("c_address");
		String c_phone=mr.getParameter("c_phone");
		String counsel=mr.getParameter("counsel");
		String[] category=mr.getParameterValues("c-cat");
		String homepage=mr.getParameter("homepage");
		String instagram=mr.getParameter("instagram");
		String blog=mr.getParameter("blog");
		String etcpart=mr.getParameter("etcpart");
		String photo_main=mr.getFilesystemName("photo_main");
		int i=0;
		for(;i<4;i++) {
			if(mr.getFilesystemName("photo-"+i)==null) break;
		}

			String[] photo= new String[i];
			
			if(i>0) {
				for(int j=0;j<i;j++) {
					photo[j]=mr.getFilesystemName("photo-"+j);
				}
			}
			
			
			
			
		
		
  	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
