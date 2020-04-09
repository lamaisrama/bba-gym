package com.bbagym.service;

import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.util.List;

import com.bbagym.dao.BoardDao;
import com.bbagym.model.vo.Board;
import com.bbagym.model.vo.BoardComment;

public class BoardService {

	private BoardDao dao = new BoardDao();

	public List<Board> selectBoardList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Board> list = dao.selectBoardList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectBoardCount() {
		Connection conn = getConnection();
		int count = dao.selectBoardCount(conn);
		close(conn);
		return count;
	}

	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.insertBoard(conn, b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public Board selectBoard(int no, boolean hasRead) {
		Connection conn = getConnection();
		Board b = dao.selectBoard(conn, no);
		
		if(!hasRead && b!=null) { 
			int result = dao.updateReadCount(conn, no);
			if(result>0) {
				commit(conn);
				b.setReadCount(dao.selectBoard(conn, no).getReadCount());	
			}else rollback(conn);
		}
		close(conn);
		return b;
	}

	public int deleteBoard(int no) {
		Connection conn = getConnection();
		int result = dao.deleteBoard(conn, no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public Board selectBoard(int no) {
		Connection conn = getConnection();
		Board b = dao.selectBoard(conn, no);
		close(conn);
		return b;
	}

	public int updateBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.updateBoard(conn, b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int commentInsert(BoardComment bc) {
		Connection conn = getConnection();
		int result = dao.commentInsert(conn, bc);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<BoardComment> selectComment(int no) {
		Connection conn = getConnection();
		List<BoardComment> list = dao.selectComment(conn, no);
		close(conn);
		return list;
	}
	
}
