package com.bbagym.controller.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.Baguni;
import com.bbagym.model.vo.Member;
import com.bbagym.service.BaguniService;

/**
 * Servlet implementation class BaguinServlet
 */
@WebServlet("/mypage/baguni.do")
public class BaguinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BaguinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ArrayList<Baguni> centerlist = new ArrayList<Baguni>();
		ArrayList<Baguni> trainerlist = new ArrayList<Baguni>();

		int mcode = ((Member)session.getAttribute("logginMember")).getM_CODE();
		String baguni="";
		Cookie[] cookies = request.getCookies();
		
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name=c.getName();
				String value=c.getValue();
				
				if(name.equals(String.valueOf(mcode))) {
					baguni=value;
				}
				
			}
		}
		
		
		
		String[] data=baguni.split("&");
		
		for(String s : data) {
			if(s.charAt(0)=='t') {
				String[] info=s.split("/");
				Baguni bg =  new Baguni();
				bg.setPcode(Integer.parseInt(info[1]));
				bg.setCount(Integer.parseInt(info[2]));
				trainerlist.add(bg);
			}else {
				String[] info=s.split("/");
				Baguni bg =  new Baguni();
				bg.setPcode(Integer.parseInt(info[1]));
				bg.setMonth(Integer.parseInt(info[2]));
				centerlist.add(bg);
			}
		}
		
		
		 new BaguniService().searchtrainer(trainerlist);
		 new BaguniService().searchcenter(centerlist);
		
		 for(Baguni b : centerlist) {
				System.out.println(b);
			}
			System.out.println("================");
			for(Baguni b : trainerlist) {
				System.out.println(b);
			}
		 
	    request.setAttribute("trainerlist", trainerlist);
	    request.setAttribute("centerlist", centerlist);
		request.getRequestDispatcher("/views/baguni/baguni.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
