package com.odd.board.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.commit;
import static com.odd.common.JDBCTemplate.getConnection;
import static com.odd.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.dao.BoardDao;
import com.odd.board.model.vo.Board;
import com.odd.board.model.vo.Reply;
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
	
	/**
	 * @param : Board 제목, 회원번호, 내용
	 * @return insert 성공여부
	 */
	public int insertBoard(Board b){
		Connection conn = getConnection();
		int result = new BoardDao().insertBoard(conn, b);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	/**
	 * 자유게시판게시글(공지사항 & 일반게시글) 조회시 조회수 +1
	 * @param boardNo
	 * @return
	 */
	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		int result = new BoardDao().increaseCount(conn, boardNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		Board b = new BoardDao().selectBoard(conn, boardNo);
		close(conn);
		return b;
	}
	
	public int updateBoard(Board b) {
		Connection conn = getConnection();
		int result = new BoardDao().updateBoard(conn, b);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 제목검색
	 */
	public int selectSearchListCountT(String keyword) {
		Connection conn = getConnection();
		int count = new BoardDao().selectSearchListCountT(conn, keyword);
		close(conn);
		return count;
	}
	public ArrayList<Board> searchBoardT(PageInfo pi, String keyword){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().searchBoardT(conn, pi, keyword);
		close(conn);
		return list;
	}
	
	/**
	 * 제목+내용검색
	 */
	public int selectSearchListCountTC(String keyword) {
		Connection conn = getConnection();
		int count = new BoardDao().selectSearchListCountTC(conn, keyword);
		close(conn);
		return count;
	}
	public ArrayList<Board> searchBoardTC(PageInfo pi, String keyword){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().searchBoardTC(conn, pi, keyword);
		close(conn);
		return list;
	}
	
	/**
	 * 작성자검색
	 */
	public int selectSearchListCountW(String keyword) {
		Connection conn = getConnection();
		int count = new BoardDao().selectSearchListCountW(conn, keyword);
		close(conn);
		return count;
	}
	public ArrayList<Board> searchBoardW(PageInfo pi, String keyword){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().searchBoardW(conn, pi, keyword);
		close(conn);
		return list;
	}
	
	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = new BoardDao().deleteBoard(conn, boardNo);
		close(conn);
		return result;
	}
	
	//-- 댓글
	public ArrayList<Reply> selectReplyList(int boardNo){
		Connection conn = getConnection();
		ArrayList<Reply> list = new BoardDao().selectReplyList(conn, boardNo);
		close(conn);
		return list;
	}
	
	public int insertReply(Reply r) {
		Connection conn = getConnection();
		int result = new BoardDao().insertReply(conn, r);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
