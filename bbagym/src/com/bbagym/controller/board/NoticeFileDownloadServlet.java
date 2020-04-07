package com.bbagym.controller.board;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeFileDownloadServlet
 */
@WebServlet("/board/noticeDownload")
public class NoticeFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName = request.getParameter("fileName");
		
		String path = getServletContext().getRealPath("upload/notice/");
		
		File f = new File(path + fileName);
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
		
		ServletOutputStream sos = response.getOutputStream(); 
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		
		String resFileName = "";
		
		boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 ||
							request.getHeader("user-agent").indexOf("Trident") != -1; 
	
		if(isMSIE) {
			resFileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
		}else {
			resFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		// response 설정
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;fileName=" + resFileName);
		
		// 전송
		int read = -1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		bis.close();
		bos.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
