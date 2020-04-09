package com.bbagym.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.Board;
import com.bbagym.model.vo.BoardComment;
import com.bbagym.service.BoardService;

/**
 * Servlet implementation class BoardVIewServlet
 */
@WebServlet("/board/boardView")
public class BoardVIewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardVIewServlet() {
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
				if("boardCookie".equals(name)) {	// boardCookie와 같은 key값이 있다면
					cookieVal = value;	// cookieVal에 value값을 저장
					if(value.contains("|"+no+"|")) {	
						hasRead = true;
						break;
					}
				}
			}
		}
		
		if(!hasRead) {	// 안읽은 거면
			Cookie c = new Cookie("boardCookie", cookieVal + "|" + no + "|");	
			c.setMaxAge(-1);	// session종료시 삭제
			response.addCookie(c);	
		}
		
		Board b = new BoardService().selectBoard(no, hasRead); 
		List<BoardComment> comments = new BoardService().selectComment(no);	//댓글
		
		String view = "";
		
		if(b==null) {	
			request.setAttribute("msg", "게시글을 찾을 수 없습니다!");
			request.setAttribute("loc", "/board/boardList");
			view = "/views/common/msg.jsp";
		}else {
			request.setAttribute("board", b);
			request.setAttribute("comment", comments);	//댓글
			view = "/views/board/boardView.jsp";
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
