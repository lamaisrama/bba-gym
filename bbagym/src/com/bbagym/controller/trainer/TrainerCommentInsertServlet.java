package com.bbagym.controller.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.model.vo.Comment;
import com.bbagym.service.TrainerService;

/**
 * Servlet implementation class TrainerCommentInsertServlet
 */
@WebServlet("/trainer/commentInsert.do")
public class TrainerCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerCommentInsertServlet() {
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
		int tCode = Integer.parseInt(request.getParameter("trainerCode"));
		int commentLevel = Integer.parseInt(request.getParameter("level"));
		int commentRef = Integer.parseInt(request.getParameter("commentRef"));
		int orderCode = Integer.parseInt(request.getParameter("orderChoice"));
		
		Comment c = new Comment();
		
		c.setCommentContent(commentContent);
		c.setmCode(mCode);
		c.settCode(tCode);
		c.setCommentLevel(commentLevel);
		c.setCommentRef(commentRef);
		c.setOrderCode(orderCode);
		
		System.out.println(c);
		
		if(commentLevel==1) {
			int orderScore = Integer.parseInt(request.getParameter("orderScore"));
			c.setOrderScore(orderScore);
			int result = new TrainerService().insertComment(c);
			int result1 = new TrainerService().insertScore(c);
			
			String msg = "";
			
			if(result>0&&result1>0) {
				msg="뎃글등록 성공";
			}else {
				msg="뎃글등록 실패";
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", "/trainer/trainerDetail.do?tCode="+tCode);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			} else {
			
		
				int result = new TrainerService().insertComment(c);
		
		
				String msg = "";
		
				if(result>0) {
					msg="뎃글등록 성공";
				}else {
					msg="뎃글등록 실패";
				}
		
				request.setAttribute("msg", msg);
				request.setAttribute("loc", "/trainer/trainerDetail.do?tCode="+tCode);
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
