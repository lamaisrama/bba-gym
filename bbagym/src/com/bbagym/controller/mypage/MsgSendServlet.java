package com.bbagym.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.service.MypageService;

/**
 * Servlet implementation class MsgSendServlet
 */
@WebServlet("/msg/send.do")
public class MsgSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MsgSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String receiver = request.getParameter("receiver");
		int sender = Integer.parseInt(request.getParameter("sender"));
		String content = request.getParameter("content");
		
		int receivernum = new MypageService().getreceivernum(receiver);
		
		if(receivernum==0) {
			response.getWriter().write("받는이를 다시 확인해주세요");
		}else {
			int result = new MypageService().sendmsg(title,receivernum,sender,content);
			if(result>0) {
			response.getWriter().write("메세지전송 성공");
			}else {
				response.getWriter().write("메세지전송 실패");
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
