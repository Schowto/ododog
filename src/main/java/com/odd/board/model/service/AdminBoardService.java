package com.odd.board.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.dao.AdminBoardDao;
import com.odd.board.model.vo.Board;
import com.odd.board.model.vo.Reply;
import com.odd.common.model.vo.PageInfo;

public class AdminBoardService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int count = new AdminBoardDao().selectListCount(conn);
		close(conn);
		return count;
	}
	public ArrayList<Board> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Board> list = new AdminBoardDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	public int selectReplyListCount() {
		Connection conn = getConnection();
		int count = new AdminBoardDao().selectReplyListCount(conn);
		close(conn);
		return count;
	}
	public ArrayList<Reply> selectReplyList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Reply> list = new AdminBoardDao().selectReplyList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 게시글 검색 결과 개수 구하는 메소드
	 * @param boardSort 게시글 검색 필터
	 * @param boardKeyword 게시글 검색 키워드
	 * @return
	 */
	public int selectSearchListCount(String boardSort, String boardKeyword) {
		Connection conn = getConnection();
		int count = new AdminBoardDao().selectSearchListCount(conn, boardSort, boardKeyword);
		close(conn);
		return count;
	}
	public int selectSearchReplyListCount(String replySort, String replyKeyword) {
		Connection conn = getConnection();
		int count = new AdminBoardDao().selectSearchReplyListCount(conn, replySort, replyKeyword);
		close(conn);
		return count;
	}

}
