package com.bbagym.controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.bbagym.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardSnImgServlet
 */
@WebServlet("/board/boardSnImg")
public class BoardSnImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSnImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				String uploadPath = "";
				uploadPath = getServletContext().getRealPath("/upload/board/"); 
			    int size = 10 * 1024 * 1024; 
				
				String fileName = ""; 
				
				try{ 
					MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new MyFileRenamePolicy());
					Enumeration files = multi.getFileNames();
					String file = (String)files.nextElement(); 
					fileName = multi.getFilesystemName(file); 
				}catch(Exception e){
					e.printStackTrace();
				}
				
				JSONObject jobj = new JSONObject();
				jobj.put("url", request.getContextPath()+"/upload/board/"+fileName);
				
				response.setContentType("application/json;charset=UTF-8"); 
				PrintWriter out = response.getWriter();
				out.print(jobj);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
