package com.bbagym.controller.board;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.BoardComment;
import com.bbagym.service.BoardService;

/**
 * Servlet implementation class BoardCommentUpdateEndServlet
 */
@WebServlet("/board/boardCommentUpdateEnd")
public class BoardCommentUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("no"));
		int boardCmtNo = Integer.parseInt(request.getParameter("nobc"));
		String content = request.getParameter("commentContent");

		System.out.println(boardNo);
		System.out.println(boardCmtNo);
		System.out.println(content);
		
		BoardComment bc = new BoardComment(boardCmtNo, 0, 0, content, null, 0, 0);
		
		int result = new BoardService().updateBoardComment(bc);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "수정완료!";
			loc = "/board/boardView?no=" + boardNo;
		}else {
			msg = "수정실패!";
			loc = "/board/boardView?no=" + boardNo; 
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
