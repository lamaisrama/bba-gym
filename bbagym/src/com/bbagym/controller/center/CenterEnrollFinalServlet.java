package com.bbagym.controller.center;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.service.CenterService;

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
		Properties program=new Properties();
		String[] pnames=request.getParameterValues("cp");
		for(int i=0;i<pnames.length;i++) {
			String[] pcosts=request.getParameterValues("cp"+i+"p");
			String pcost=String.join(",", pcosts);
			System.out.println(pnames[i]+"의 pcost"+pcost);
			program.put(pnames[i], pcost);
		}
		//c.setProgram(program);
		int result=new CenterService().enrollCenter(c);
		String msg="", loc="";
		if(result>0) {
			msg="등록 완료, 관리자의 승인이 되면 자동으로 시설 찾기에 업로드 됩니다. 자세한 사항은 마이페이지의 등록 현황을 확인해주세요";
			loc="/views/index.jsp";
			
		}else {
			msg="등록 실페, 관리자에게 문의하세요";
			loc="/views/index.jsp";
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
