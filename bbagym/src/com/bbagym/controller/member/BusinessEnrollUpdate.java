package com.bbagym.controller.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbagym.model.vo.Member;
import com.bbagym.service.MemberService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BusinessEnrollUpdate
 */
@WebServlet("/business/updateBusiness.do")
public class BusinessEnrollUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessEnrollUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 if(!ServletFileUpload.isMultipartContent(request)) {
	         request.setAttribute("msg", "작성오류!");
	         request.setAttribute("loc", "/business/businessEnrollView.do");
	         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	         return;
	      }
		  String path= getServletContext().getRealPath("/upload/business/");
	      int maxSize = 1024*1024*10;
	      
	      MultipartRequest mr = new MultipartRequest(request, path,maxSize,"utf-8",new DefaultFileRenamePolicy());
	     int M_CODE = Integer.parseInt(mr.getParameter("M_CODE"));
		 String M_ID=mr.getParameter("id");
		String M_NAME=mr.getParameter("M_NAME");
		char M_GENDER=mr.getParameter("M_GENDER").charAt(0);
		int M_AGE=Integer.parseInt(mr.getParameter("M_AGE"));   //코드 이름 성별 나이 주 폰 이미지
		String M_EMAIL=mr.getParameter("M_EMAIL");
		String M_ADDRESS=mr.getParameter("M_ADDRESS");
		int M_LEVEL = Integer.parseInt(mr.getParameter("M_LEVEL"));
		String M_PHONE=mr.getParameter("M_PHONE");
		String M_IMAGE=mr.getFilesystemName("M_IMAGE");
		String M_PHONE2=mr.getParameter("M_PHONE2");
		String M_ADDRESS_2=mr.getParameter("M_ADDRESS_2");
		String BUSINESS_CODE=mr.getParameter("BUSINESS_CODE");
		String oldImg = mr.getParameter("oldFileName");
		
		File f = mr.getFile("M_IMAGE");
		
		if(f!=null&&f.length()>0) {
			File delFile = new File(path+oldImg);
			boolean flag = delFile.delete();
			System.out.println(flag);
		}else {
			M_IMAGE = oldImg;
		}
		
		Member m = new Member(M_CODE,M_ID,null,M_NAME,M_EMAIL,M_PHONE,M_ADDRESS,0,null,' ',M_IMAGE,M_PHONE2,M_ADDRESS_2,M_GENDER,M_AGE,BUSINESS_CODE);
		
		
		int result=new MemberService().updateBusiness(m);
		  System.out.println("멤버코드"+M_CODE);
		  System.out.println("멤버아이디"+M_ID);
		  System.out.println("멤버레벨"+M_LEVEL);
		  
		  
		  HttpSession session = request.getSession();
		  
	
		  String msg="";
	      String loc="";
	   
	    
	      if(result>0&&M_LEVEL==1) {
	    	  msg="수정완료";
	    	  loc="/mypage/mypageUser.do";
//	    	  session.setAttribute("logginMember", m);
	    }else if(result>0&&M_LEVEL==2) {
	    	  msg="수정완료";
	    	  loc="/mypage/mypageBusiness.do"; 
//	    	  session.setAttribute("logginMember", m);
	      }else {
	    	  msg="수정실패";
	    	  loc="";
	    	      
	      }
	      request.setAttribute("msg", msg);
		     request.setAttribute("loc", loc);
		     request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
	      }
		 


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
