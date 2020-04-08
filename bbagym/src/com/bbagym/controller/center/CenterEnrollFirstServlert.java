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
		
		CenterEnroll c= new CenterEnroll();
		c.setMemberCode(Integer.parseInt(request.getParameter("m-code")));
		c.setName(request.getParameter("c-name"));
		c.setAddress(request.getParameter("c-address"));
		c.setTel(request.getParameter("c-tel"));
		c.setOpHr(request.getParameter("c-operating-hr"));
		c.setHoliday(request.getParameter("c-holiday"));
		String[] cat=request.getParameterValues("c-cat");
		String[] fac=request.getParameterValues("c-fac");
		c.setCategories(new ArrayList());
		c.setFacilities(new ArrayList());
		if(cat!=null) {
			for(String s : cat) {
				c.getCategories().add(s);
			}
		}
		if(fac!=null) {
			for(String s : fac) {
				c.getFacilities().add(s);
			}			
		}
		c.setSnsHome(request.getParameter("sns-homepage"));
		c.setSnsInsta(request.getParameter("sns-insta"));
		c.setSnsBlog(request.getParameter("sns-blog"));
		c.setSnsEtc(request.getParameter("sns-etc"));
		
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
