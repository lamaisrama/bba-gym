package com.bbagym.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbagym.common.MyFileRenamePolicy;
import com.bbagym.model.vo.Notice;
import com.bbagym.service.NoticeService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeWriteEndServlet
 */
@WebServlet("/board/noticeWriteEnd")
public class NoticeWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항 작성 오류[enctype]");
			request.setAttribute("loc", "/board/noticeWrite");
			request.getRequestDispatcher("/views/common/msg/jsp").forward(request, response);
			return;
		}
		
		String path = getServletContext().getRealPath("/upload/notice/");
		int maxSize = 1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new MyFileRenamePolicy());
		Notice n = new Notice(0, mr.getParameter("title"), mr.getParameter("content"), 
								null, mr.getOriginalFileName("upfile"), mr.getFilesystemName("upfile"),
								0, mr.getParameter("writer"), 'Y');
		
		int result = new NoticeService().insertNotice(n);
		
		String msg ="";
		String loc ="";
		if(result>0) {
			msg = "게시글 등록 성공!";
			loc = "/board/noticeList";
		}else {
			msg = "게시글 등록 실패!";
			loc = "/board/noticeWrite";
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















