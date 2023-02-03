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

}
