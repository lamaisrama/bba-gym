package com.bbagym.controller.center;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.CenterDetail;
import com.bbagym.model.vo.Comment;
import com.bbagym.service.CenterService;

/**
 * Servlet implementation class CenterCommentInsertServlet
 */
@WebServlet("/center/commentInsert.do")
public class CenterCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String commentContent = request.getParameter("commentContent");
		int mCode = Integer.parseInt(request.getParameter("commentWriter"));
		int cCode = Integer.parseInt(request.getParameter("centerCode"));
		int commentLevel = Integer.parseInt(request.getParameter("level"));
		int commentRef = Integer.parseInt(request.getParameter("commentRef"));
		int orderCode = Integer.parseInt(request.getParameter("orderChoice"));
//		int orderScore = Integer.parseInt(request.getParameter("orderScore"));
//		int pCode = (int)request.getAttribute("data-meta");
//		int month = (int)request.getAttribute("data-meta2");
		
//		System.out.println(orderScore);
		
		Comment c = new Comment();
		
		c.setCommentContent(commentContent);
		c.setmCode(mCode);
		c.setcCode(cCode);
		c.setCommentLevel(commentLevel);
		c.setCommentRef(commentRef);
//		c.setmName(mName);
		c.setOrderCode(orderCode);
//		c.setOrderScore(orderScore);
		
		System.out.println(c);
		
		if(commentLevel==1) {
			int orderScore = Integer.parseInt(request.getParameter("orderScore"));
			c.setOrderScore(orderScore);
			int result = new CenterService().insertComment(c);
			int result1 = new CenterService().insertScore(c);
			
			String msg = "";
			
			if(result>0&&result1>0) {
				msg="뎃글등록 성공";
			}else {
				msg="뎃글등록 실패";
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", "/center/centerDetail.do?cCode="+cCode);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		} else {
			
		
		int result = new CenterService().insertComment(c);
//		int result1 = new CenterService().insertScore(c);
		
		
		String msg = "";
		
		if(result>0) {
			msg="뎃글등록 성공";
		}else {
			msg="뎃글등록 실패";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/center/centerDetail.do?cCode="+cCode);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
