package com.bbagym.controller.center;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbagym.model.vo.CenterEnroll;
import com.bbagym.model.vo.Price;
import com.bbagym.model.vo.Program;
import com.bbagym.service.CenterService2;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CenterEnrollFinalServlet
 */
@WebServlet("/centerEnrollEnd")
public class CenterEnrollFinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterEnrollFinalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		CenterEnroll c = (CenterEnroll)session.getAttribute("centerEnroll");
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "센터 등록 오류[form:encType] 관리자에게문의하세요");
			request.setAttribute("loc", "/centerView");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return; //return을 넣어서 종료 해야함! 
		}
		
		String path=getServletContext().getRealPath("/upload/center/");
		int maxSize=1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8",new DefaultFileRenamePolicy());
		c.setMainImage(mr.getFilesystemName("c-photo0"));
		c.setPhotos(new ArrayList());
		c.getPhotos().add(mr.getFilesystemName("c-photo1"));
		for(int i=0;i<4;i++) {	
			if(mr.getFilesystemName("c-photo"+(i+2))!=null){
				c.getPhotos().add(mr.getFilesystemName("c-photo"+(i+1)));
			}
		}
		c.setSchedulePath(mr.getParameter("c-timetable"));
		c.setText(mr.getParameter("c-text"));
		c.setProgram(new ArrayList());
		String[] pnames=mr.getParameterValues("cp");
		for(int i=0;i<pnames.length;i++) {
			c.getProgram().add(new Program(pnames[i]));
			String[] pcosts=mr.getParameterValues("cp"+i+"p");
			for(int j=0;j<4;j++) {
				switch(j) {
					case 0: {
						Price p = new Price(1, Integer.parseInt(pcosts[j]));
						c.getProgram().get(i).getPrices().add(p);
						break;
					}
					case 1: {
						Price p = new Price(3, Integer.parseInt(pcosts[j]));
						c.getProgram().get(i).getPrices().add(p);
						break; 
					}
					case 2: {
						Price p = new Price(6, Integer.parseInt(pcosts[j]));
						c.getProgram().get(i).getPrices().add(p);
						break;
					}
					case 3: {
						Price p = new Price(12, Integer.parseInt(pcosts[j]));
						c.getProgram().get(i).getPrices().add(p);
						break; 
					}
				}
			}
		}
		int result=new CenterService2().enrollCenter(c);
		String msg="", loc="";
		if(result==1) {
			msg="등록 완료! 관리자의 승인이 완료되면 자동으로 시설 찾기에 업로드 됩니다. 자세한 사항은 마이페이지의 등록 현황을 확인해주세요";
			loc="/index.jsp";
		}else {
			msg="등록 실패, 관리자에게 문의하세요";
			loc="/center/centerEnroll.do";
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
