package com.bbagym.controller.center;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		int maxSize=1024*1024*10;
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8",new DefaultFileRenamePolicy());
		
		CenterEnroll c= new CenterEnroll();
		c.setName(mr.getParameter("c-name"));
		c.setAddress(mr.getParameter("c-address"));
		c.setTel(mr.getParameter("c-tel"));
		c.setOpHr(mr.getParameter("c-operating-hr"));
		c.setHoliday(mr.getParameter("c-holiday"));
		String[] cat=mr.getParameterValues("c-cat");
		String[] fac=mr.getParameterValues("c-fac");
		for(String s : cat) {
			c.getCategories().add(s);
		}
		for(String s : fac) {
			c.getFacilities().add(s);
		}
		c.setSnsHome(mr.getParameter("sns-homepage"));
		c.setSnsInsta(mr.getParameter("sns-insta"));
		c.setSnsBlog(mr.getParameter("sns-blog"));
		c.setSnsEtc(mr.getParameter("sns-etc"));
		String photo=mr.getFilesystemName("c-photo");
		List<String> photos=new ArrayList();
		photos.add(mr.getFilesystemName("c-photo0"));
		for(int i=0;i<4;i++) {
			if(mr.getFilesystemName("c-photo"+(i+1))!=null){
				photos.add(mr.getFilesystemName("c-photo"+(i+1)));
			}
		}
		
		HttpSession session=request.getSession();
		session.setAttribute("centerEnroll", c);
		System.out.println(c);
		System.out.println(session.getAttribute("centerEnroll"));
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
