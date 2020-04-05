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
	
	
	
}