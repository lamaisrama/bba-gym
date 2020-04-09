package com.bbagym.controller.trainer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbagym.model.vo.Price;
import com.bbagym.model.vo.Program;
import com.bbagym.model.vo.TrainerEnroll;
import com.bbagym.service.TrainerService2;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class TrainerEnrollFinalServlet
 */
@WebServlet("/trainer/trainerEnrollEnd")
public class TrainerEnrollFinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerEnrollFinalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TrainerEnroll te = (TrainerEnroll)request.getSession().getAttribute("trainerEnroll");
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된접근입니다");
			request.setAttribute("loc", "/trainer/trainerEnroll.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path=getServletContext().getRealPath("/upload/trainer/");
		int maxsize=1024*1024*100;
		MultipartRequest mr = new MultipartRequest(request,path,maxsize,"utf-8",new DefaultFileRenamePolicy());
		te.setText(mr.getParameter("t-text"));
		te.setCareer(mr.getParameter("t-career"));
		te.setMainImage(mr.getFilesystemName("t_photo_main"));
		te.setPhotos(new ArrayList());
		te.getPhotos().add(mr.getFilesystemName("photo-0"));
		for(int i=0;i<4;i++) {	
			if(mr.getFilesystemName("photo-"+(i+1))!=null){
				te.getPhotos().add(mr.getFilesystemName("photo-"+(i+1)));
			}
		}
		te.setProgram(new ArrayList());
		String[] pnames=mr.getParameterValues("tp");
		for(int i=0;i<pnames.length;i++) {
			if(pnames[i]!=null) {
				te.getProgram().add(new Program(pnames[i]));
				String[] counts=mr.getParameterValues("t-p-count-"+i);
				String[] price =mr.getParameterValues("t-p-price-"+i);
				for(int j=0;j<counts.length;j++) {
					te.getProgram().get(i).getPrices()
					.add(new Price(Integer.parseInt(counts[j]), Integer.parseInt(price[j])));
				}
			}
		}
		
		int result=new TrainerService2().enrollTrainer(te);
		String msg="", loc="";
		if(result==1) {
			msg="등록 완료! 관리자의 승인이 완료되면 자동으로 트레이너 찾기에 업로드 됩니다. 자세한 사항은 마이페이지의 등록 현황을 확인해주세요";
			loc="/index.jsp";
		}else {
			msg="등록 실패, 관리자에게 문의하세요";
			loc="/trainer/trainerEnroll.do";
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
