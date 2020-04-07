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
import com.bbagym.model.vo.Notice;
import com.bbagym.service.NoticeService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeUpdateEndServlet
 */
@WebServlet("/board/noticeUpdateEnd")
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("msg", "공지사항 작성 오류! [ form : enctype ]");
			request.setAttribute("loc", "/board/noticeWrite");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}		
		
		String path = getServletContext().getRealPath("/upload/notice/");
		
		int maxSize = 1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		int noticeNo = Integer.parseInt(mr.getParameter("no"));
		
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content = mr.getParameter("content");
		String oriFile = mr.getParameter("oriFile");
		String fileName = mr.getFilesystemName("upfile");
		System.out.println(writer);
		File f = mr.getFile("upfile");
		
		if(f!=null && f.length() > 0) {
			
			File delFile = new File(path + oriFile);
			boolean flag = delFile.delete();
			System.out.println(flag);	// true면 지워진 것
		}else {
			// 첨부파일이 없을때 이전 파일을 계속 저장
			fileName = oriFile;
		}
		
		Notice n = new Notice(noticeNo, title, content, null, fileName, null, 0, Integer.parseInt(writer), 'Y');
		int result = new NoticeService().updateNotice(n);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "수정완료!";
			loc = "/board/noticeView?no=" + noticeNo;
		}else {
			msg = "수정실패!";
			loc = "/board/noticeUpdate?no=" + noticeNo;
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
