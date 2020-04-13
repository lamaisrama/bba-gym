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
 * Servlet implementation class BoardFinderServlet
 */
@WebServlet("/board/boardFinder")
public class BoardFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFinderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		System.out.println(searchType);
		int cPage;
		
		try { // 처음 주소값.
			cPage = Integer.parseInt(request.getParameter("cPage")); 
		}catch(NumberFormatException e) {  
			cPage = 1; // 초기화. 
		}
		
		int numPerPage = 10; 
		
		List<Board> list = new BoardService().searchBoard(searchType, searchKeyword, cPage, numPerPage);
		
		String pageBar = "";
		pageBar+= "<ul class='pagination justify-content-center'>";
		
		int totalData = new BoardService().selectCount(searchType, searchKeyword);
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize = 3;
		int pageNo = ((cPage-1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		if(pageNo==1) { // 페이지가 1 
			pageBar+="<li class='page-item'><a class='page-link' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
		}else { 
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





















