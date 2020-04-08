package com.bbagym.service;

import java.sql.Connection;
import java.util.List;

import static com.bbagym.common.JDBCTemplate.getConnection;
import static com.bbagym.common.JDBCTemplate.close;
import static com.bbagym.common.JDBCTemplate.commit;
import static com.bbagym.common.JDBCTemplate.rollback;


import com.bbagym.dao.NoticeDao;
import com.bbagym.model.vo.Notice;

public class NoticeService {

	private NoticeDao dao = new NoticeDao();

	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Notice> list = dao.selectNoticeList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectNoticeCount() {
		Connection conn = getConnection();
		int count = dao.selectNoticeCount(conn);
		close(conn);
		return count;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = dao.insertNotice(conn, n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public Notice selectNotice(int no, boolean hasRead) {
		Connection conn = getConnection();
		Notice n = dao.selectNotice(conn, no);
		
		if(!hasRead && n!=null) { 
			int result = dao.updateReadCount(conn, no);
			if(result>0) {
				commit(conn);
				n.setReadCount(dao.selectNotice(conn, no).getReadCount());	
			}else rollback(conn);
		}
		close(conn);
		return n;
	}

	public Notice selectNotice(int no) {
		Connection conn = getConnection();
		Notice n = dao.selectNotice(conn, no);
		close(conn);
		return n;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = dao.noticeUpdate(conn, n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteNotice(int no) {
		Connection conn = getConnection();
		int result = dao.deleteNotice(conn, no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
}
