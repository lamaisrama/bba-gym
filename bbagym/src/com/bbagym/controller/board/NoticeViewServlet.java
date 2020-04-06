package com.bbagym.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.Notice;
import com.bbagym.service.NoticeService;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/board/noticeView")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		Cookie[] cookies = request.getCookies();
		String cookieVal = "";
		boolean hasRead = false;	// false면 조회수 증가, true면 조회수 증가안함
		if(cookies!=null){
			for(Cookie c : cookies) {
				String name = c.getName();	
				String value = c.getValue();	
				if("noticeCookie".equals(name)) {	// boardCookie와 같은 key값이 있다면
					cookieVal = value;	// cookieVal에 value값을 저장
					if(value.contains("|"+no+"|")) {	
						hasRead = true;
						break;
					}
				}
			}
		}
		
		if(!hasRead) {	// 안읽은 거면
			Cookie c = new Cookie("noticeCookie", cookieVal + "|" + no + "|");	
			c.setMaxAge(-1);	// session종료시 삭제
			response.addCookie(c);	
		}
		
		Notice n = new NoticeService().selectNotice(no, hasRead); 
		
		String view = "";
		
		if(n==null) {	
			request.setAttribute("msg", "공지글을 찾을 수 없습니다!");
			request.setAttribute("loc", "/board/noticeList");
			view = "/views/common/msg.jsp";
		}else {
			request.setAttribute("notice", n);	
			view = "/views/board/noticeView.jsp";
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
