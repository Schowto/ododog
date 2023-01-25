package com.odd.board.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;

import com.odd.board.model.dao.BoardDao;

public class BoardService {
	
	/**
	 * @return 공지사항 제외한 총 일반게시글 수 (페이징 처리에 필요)
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int count = new BoardDao().selectListCount(conn);
		close(conn);
		return count;
	}

}
