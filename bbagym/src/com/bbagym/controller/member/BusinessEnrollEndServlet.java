package com.bbagym.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbagym.model.vo.Member;
import com.bbagym.service.MemberService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BusinessEnrollEndServlet
 */
@WebServlet(name="BusinessEnrollEndServlet",urlPatterns="/business/memberEnrollEnd")
public class BusinessEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "작성 오류![form:encType]");
			request.setAttribute("loc", "/member/memberEnroll.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
			return;
		}
		String path=getServletContext().getRealPath("/upload/business/");
		
		int maxSize=1024*1024*10; 
		
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		String userId =mr.getParameter("userId");  //오류수정
		String pw = mr.getParameter("M_PW");
		String name = mr.getParameter("M_NAME");
		char gender = mr.getParameter("M_GENDER").charAt(0);
		int age = Integer.parseInt(mr.getParameter("M_AGE"));
		String email = mr.getParameter("M_EMAIL");
		String address = mr.getParameter("M_ADDRESS");
		String phone = mr.getParameter("M_PHONE"); 						
	    String image=mr.getFilesystemName("M_IMAGE");
	    String b_code=mr.getParameter("BUSINESS_CODE");
	    String m_phone2=mr.getParameter("M_PHONE2");
	    String m_address2=mr.getParameter("M_ADDRESS_2");
		
		
	    Member m = new Member(1,userId,pw,name,email,phone,address,2,null,' ',image,m_phone2,m_address2,gender,age,b_code);
	      int result=new MemberService().insertBusiness(m);
		
	      String msg="";
			String loc="";
			if(result>0) {
				//회원가입성공
				msg="축하합니다.회원가입에 성공하셨습니다!";
				loc="";
			}else {
				//회원가입실패
				msg="아쉽게도 회원가입에 실패하였습니다.!";
				
				loc="/business/businessEnroll.do";
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
