package com.bbagym.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.Board;
import com.bbagym.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int cPage;
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerPage = 5;
		
		List<Board> list = new BoardService().selectBoardList(cPage, numPerPage);
		
		int totalData = new BoardService().selectBoardCount();
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		String pageBar = "";
		pageBar+= "<ul class='pagination justify-content-center'>";
		
		int pageBarSize = 3;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;	// 시작
		int pageEnd = pageNo+pageBarSize-1;	// 끝
		
		
		// prev
		if(pageNo==1) { // 페이지가 1 
			pageBar+="<li class='page-item'><a class='page-link' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
		}else { // 현재페이지가 2이상이면 prev클릭시 -1페이지로 이동
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
						+ "/board/boardList?cPage=" + (pageNo-1)
						+ "&numPerPage=" + numPerPage 
						+ "'aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
		}
		
		// page
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				
				pageBar+="<li class='page-item'><a class='page-link'>"+pageNo+"</a></li>";
				
			}else {
				pageBar+="<li><a class='page-link' href='"+request.getContextPath()
							+"/board/boardList?cPage=" + pageNo 
							+"&numPerPage=" + numPerPage
							+ "'>"+pageNo + "</a></li>";
			}
			pageNo++;
		}
		
		
		// next
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item'><a class='page-link' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
		}else {
			pageBar+="<a class='page-link' href='"+request.getContextPath()
						+"/board/boardList?cPage="+pageNo
						+"&numPerPage="+numPerPage
						+"'aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
