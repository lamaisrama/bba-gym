package com.bbagym.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.Member;
import com.bbagym.service.MyPageService2;

/**
 * Servlet implementation class BaguniPaymentServlet
 */
@WebServlet("/mypage/payment.do")
public class BaguniPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BaguniPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//mCode 불러오기
		int mCode=0;
		HttpSession session = request.getSession();
		if(session.getAttribute("logginMember")!=null) {
			Member m = (Member)session.getAttribute("logginMember");
			mCode = m.getM_CODE();
		}else {
			request.setAttribute("msg","로그인이 필요합니다.");
			request.setAttribute("loc", "/member/membeLoginView.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		//결제된 센터/트레이너 내역 불러오기
		String[] centerList = request.getParameterValues("centerList");	
		String[] trainerList = request.getParameterValues("trainerList");
		
		
		
		//DB에 결제 내역 넣기
		int result=new MyPageService2().insertOrderHistory(mCode, centerList, trainerList);
		String msg="", loc="/mypage/mypageUser.do";
		if(result>0) {
			//결제된 쿠키 지우기
			String value="";
			Cookie[] cookies = request.getCookies();
			if(cookies!=null) {
				for(Cookie c : cookies) {
					if(c.getName().equals(""+mCode)) {
						System.out.println("불러온 이름:"+c.getName());
						value=c.getValue();
						System.out.println("불러온 value:"+value);
					}
				}
			}
			msg="결제 완료. 감사합니다.";
			request.setAttribute("msg", msg); 
			request.setAttribute("loc", "/ShoppingBaguniDeleteServlet.do?value=delete");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
		}else{
			msg="결제는 완료되었으나, 결제내역에 저장을 실패하였습니다. 관리자에게 문의 해주세요.";
			request.setAttribute("msg", msg); 
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
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
