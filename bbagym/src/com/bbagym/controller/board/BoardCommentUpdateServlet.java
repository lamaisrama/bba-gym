package com.bbagym.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.Board;
import com.bbagym.model.vo.BoardComment;
import com.bbagym.service.BoardService;

/**
 * Servlet implementation class BoardCommentUpdateServlet
 */
@WebServlet("/board/boardCommentUpdate")
public class BoardCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("nobc"));
		System.out.println(no);
		String content = request.getParameter("commentContent");
		
		BoardComment bc = new BoardComment();
//		BoardComment bc = new BoardService().selectBoardComment(no);
		
//		BoardComment bc = new BoardComment(no, 0, 0, content, null, 0, 0);
		
		int result = new BoardService().updateBoardComment(bc);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "수정완료!";
			loc = "/board/boardView?no=" + no;
		}else {
			msg = "수정실패!";
			loc = "/board/boardView?no=" + no;
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
