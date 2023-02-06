package com.odd.board.model.service;

import static com.odd.common.JDBCTemplate.*;

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
	public ArrayList<Board> searchList(PageInfo pi, String boardSort, String boardKeyword){
		Connection conn = getConnection();
		ArrayList<Board> list = new AdminBoardDao().searchList(conn, pi, boardSort, boardKeyword);
		close(conn);
		return list;
	}
	public ArrayList<Reply> searchReplyList(PageInfo replyPi, String replySort, String replyKeyword){
		Connection conn = getConnection();
		ArrayList<Reply> list = new AdminBoardDao().searchReplyList(conn, replyPi, replySort, replyKeyword);
		close(conn);
		return list;
	}
	
	/**
	 * 게시글 상태 변경 : 일반게시글, 댓글, 공지사항
	 * @param boardNo
	 * @param status 기존 상태
	 * @return
	 */
	public int updateStatus(int boardNo, String status) {
		Connection conn = getConnection();
		int result = new AdminBoardDao().updateStatus(conn, boardNo, status);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int updateStatusR(int replyNo, String status) {
		Connection conn = getConnection();
		int result = new AdminBoardDao().updateStatusR(conn, replyNo, status);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = new AdminBoardDao().deleteBoard(conn, boardNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deleteReply(int replyNo) {
		Connection conn = getConnection();
		int result = new AdminBoardDao().deleteReply(conn, replyNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
