package com.bbagym.controller.center;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.CenterEnroll;

/**
 * Servlet implementation class CenterEnrollFinalServlet
 */
@WebServlet("/centerEnrollEnd")
public class CenterEnrollFinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterEnrollFinalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		CenterEnroll c = (CenterEnroll)session.getAttribute("centerEnroll");
		c.setText(request.getParameter("cText"));
		Map map = new HashMap();
		String[] pnames=request.getParameterValues("cp");
		for(int i=0;i<pnames.length;i++) {
			String key = pnames[i];
			int[] values=new int[4];
			for(int j=0;j<4;j++) {
				values[i]=Integer.parseInt(request.getParameter("cp"+i+"p"+j));
			}
			map.put(key, values);
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
