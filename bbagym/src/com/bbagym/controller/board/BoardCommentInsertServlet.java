package com.bbagym.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.BoardComment;
import com.bbagym.service.BoardService;



/**
 * Servlet implementation class BoardCommentInsertServlet
 */
@WebServlet("/board/boardCommentInsert")
public class BoardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String commentContent = request.getParameter("commentContent");
		int commentWriter = Integer.parseInt(request.getParameter("commentWriter"));
		int boardRef = Integer.parseInt(request.getParameter("boardRef"));
		int level = Integer.parseInt(request.getParameter("level"));
		int commentRef = Integer.parseInt(request.getParameter("commentRef"));
//		String commentWriter2 = request.getParameter("commentWriter2");
										
		BoardComment bc = new BoardComment(0, commentRef, level, commentContent, null, boardRef, commentWriter);
//		BoardComment bc2 = new BoardComment(0, commentRef, level, commentContent, null, boardRef, 0, commentWriter2);
				
		int result = new BoardService().commentInsert(bc);
		
		// 화면 선택!
		String msg = "";
		if(result>0) {
			msg = "댓글 등록 성공!";
		}else {
			msg = "댓글 등록 실패!";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/board/boardView?no=" + boardRef);
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
