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
 * Servlet implementation class NoticeSnImgServlet
 */
@WebServlet("/board/noticeSnImg")
public class NoticeSnImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSnImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("들어와");
		
//		
	
	
//		// 이미지 업로드할 경로
//		String uploadPath = "/upload/notice/";
//	    int size = 10 * 1024 * 1024; 
//		
//		String fileName = ""; // 파일명
//		
//		try{ // 파일 업로드, 파일명 가져오기
//			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new MyFileRenamePolicy());
//			Enumeration files = multi.getFileNames();
//			String file = (String)files.nextElement(); 
//			fileName = multi.getFilesystemName(file); 
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		
//	    // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
//		uploadPath = "/upload/notice/" + fileName;
//		
//	    // 생성된 경로를 JSON 형식으로 보내주기 위한 설정
//		JSONObject jobj = new JSONObject();
//		jobj.put("url", uploadPath);
//		
//		response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
//		PrintWriter out = response.getWriter();
//		out.print(jobj.toJSONString());
		
//////////////////////		
		
		
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
//		// 업로드할 폴더 경로
//		String realFolder = request.getSession().getServletContext().getRealPath("upload");
//		
//
//		// 업로드할 파일 이름
//		String org_filename = file.getOriginalFilename();
//		
//
//		System.out.println("원본 파일명 : " + org_filename);
//		System.out.println("저장할 파일명 : " + str_filename);
//
//		String filepath = realFolder + "\\" + email + "\\" + str_filename;
//		System.out.println("파일경로 : " + filepath);
//
//		File f = new File(filepath);
//		if (!f.exists()) {
//		f.mkdirs();
//		}
//		file.transferTo(f);
//		out.println("profileUpload/"+email+"/"+str_filename);
//		out.close();
//		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
