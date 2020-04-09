package com.bbagym.controller.board;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbagym.common.MyFileRenamePolicy;
import com.bbagym.model.vo.Board;
import com.bbagym.service.BoardService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateEndServlet
 */
@WebServlet("/board/boardUpdateEnd")
public class BoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("msg", "공지사항 작성 오류! [ form : enctype ]");
			request.setAttribute("loc", "/board/boardWrite");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}		
		
		String path = getServletContext().getRealPath("/upload/board/");
		
		int maxSize = 1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		int boardNo = Integer.parseInt(mr.getParameter("no"));
		
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content = mr.getParameter("content");
		String oriFile = mr.getParameter("oriFile");
		String fileName = mr.getFilesystemName("upfile");
		System.out.println(writer);
		
		File f = mr.getFile("upfile");
		
		if(f!=null&&f.length()>0) {
			File delFile = new File(path + oriFile);
			boolean flag = delFile.delete();
			System.out.println(flag);	// true면 지워진 것
		}else {
			// 첨부파일이 없을때 이전 파일을 계속 저장
			fileName = oriFile;
		}
		
		Board b = new Board(boardNo, title, content, null, fileName, null, 0, Integer.parseInt(writer));
		//Board b = new Board(boardNo, title, content, null, fileName, null, 0, writer);
		
		int result = new BoardService().updateBoard(b);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "수정완료!";
			loc = "/board/boardView?no=" + boardNo;
		}else {
			msg = "수정실패!";
			loc = "/board/boardUpdate?no=" + boardNo;
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
