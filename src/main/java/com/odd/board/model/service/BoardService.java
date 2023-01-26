package com.odd.board.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.dao.BoardDao;
import com.odd.board.model.vo.Board;
import com.odd.common.model.vo.PageInfo;

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
	/**
	 * @return 공지사항 개수 (15-count -> boardLimit)
	 */
	public int selectNoticeCount() {
		Connection conn = getConnection();
		int count = new BoardDao().selectNoticeCount(conn);
		close(conn);
		return count;
	}
	public ArrayList<Board> selectNoticeList(){
		Connection conn = getConnection();
		ArrayList<Board> nList = new BoardDao().selectNoticeList(conn);
		close(conn);
		return nList;
	}
	public ArrayList<Board> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		close(conn);
		return list;
	}

}
