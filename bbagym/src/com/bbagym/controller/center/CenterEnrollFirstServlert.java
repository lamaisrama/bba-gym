package com.bbagym.controller.center;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbagym.model.vo.CenterEnroll;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CenterEnrollFirstServlert
 */
@WebServlet("/centerEnroll.do")
public class CenterEnrollFirstServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterEnrollFirstServlert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "센터 등록 오류[form:encType] 관리자에게문의하세요");
			request.setAttribute("loc", "/centerView");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return; //return을 넣어서 종료 해야함! 
		}
		String path=getServletContext().getRealPath("/upload/center/");
		System.out.println("CE1S 경로 : "+path);
		int maxSize=1024*1024*10;
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, new DefaultFileRenamePolicy());
		String name=mr.getParameter("c-name");
		String address=mr.getParameter("c-address");
		String tel = mr.getParameter("c-tel");
		String ophr = mr.getParameter("c-operating-hr");
		String holiday=mr.getParameter("c-holiday");
		String[] categories = mr.getParameterValues("c-cat"); 
		String[] facilities = mr.getParameterValues("c-fac");
		Properties sns = new Properties();
			for(int i=1;i<5;i++) {
				sns.put("sns"+i, mr.getParameter("sns")+i);
			}
		String photo=mr.getFilesystemName("c-photo");
		List<String> photos=new ArrayList();
		photos.add(mr.getFilesystemName("c-photo0"));
		for(int i=0;i<4;i++) {
			if(mr.getFilesystemName("c-photo"+(i+1))!=null){
				photos.add(mr.getFilesystemName("c-photo"+(i+1)));
			}
		}
		CenterEnroll c= new CenterEnroll(name, address, tel, ophr, holiday,
				categories, facilities, sns, photo, photos);
		
		HttpSession session=request.getSession();
		session.setAttribute("centerEnroll", c);
		request.getRequestDispatcher("/views/center/centerEnroll-2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
