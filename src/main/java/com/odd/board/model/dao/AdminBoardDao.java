package com.odd.board.model.dao;

import static com.odd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.odd.board.model.vo.Board;
import com.odd.board.model.vo.Reply;
import com.odd.common.model.vo.PageInfo;

public class AdminBoardDao {
	
	private Properties prop = new Properties();

	public AdminBoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdminBoardDao.class.getResource("/db/sql/adminBoard-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param conn
	 * @return 총 일반게시글 수
	 */
	public int selectListCount(Connection conn) {
		// select
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	public ArrayList<Board> selectList(Connection conn, PageInfo pi){
		// select
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit()-1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"),
								   rset.getString("board_title"),
								   rset.getString("user_id"),
								   rset.getInt("count"),
								   rset.getString("create_date"),
								   rset.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int selectReplyListCount(Connection conn) {
		// select
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	public ArrayList<Reply> selectReplyList(Connection conn, PageInfo pi){
		// select
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit()-1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Reply(rset.getInt("reply_no"),
								   rset.getInt("board_no"),
								   rset.getString("user_id"),
								   rset.getString("reply_content"),
								   rset.getString("create_date"),
								   rset.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int selectSearchListCount(Connection conn, String boardSort, String boardKeyword) {
		// select
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchListCount");
		
		if(boardKeyword != null) {
			if(boardSort.equals("title")) {
				sql += " AND BOARD_TITLE LIKE '%' || '" + boardKeyword + "' || '%'";
			} else {
				sql += " AND (SELECT USER_ID FROM MEMBER WHERE BOARD_WRITER = USER_NO) LIKE '%' || '";
				sql += boardKeyword;
				sql += "' || '%'";
			}			
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	public int selectSearchReplyListCount(Connection conn, String replySort, String replyKeyword) {
		// select
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchReplyListCount");
		
		if(replyKeyword != null) {
			if(replySort.equals("content")) {
				sql += " AND REPLY_CONTENT LIKE '%' || '" + replyKeyword +  "' || '%'";
			} else {
				sql += " AND (SELECT USER_ID FROM MEMBER WHERE REPLY_WRITER = USER_NO) LIKE '%' || '";
				sql += "keyword";
				sql += "' || '%'";
			}			
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	public ArrayList<Board> searchList(Connection conn, PageInfo pi, String boardSort, String boardKeyword){
		// select
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchList");
		if(boardKeyword != null) {
			if(boardSort.equals("title")) {
				// 제목검색
				sql += " AND BOARD_TITLE LIKE '%' || '" + boardKeyword + "' || '%'";
			} else {
				// 작성자검색
				sql += " AND (SELECT USER_ID FROM MEMBER WHERE BOARD_WRITER = USER_NO) LIKE '%' || '" + boardKeyword + "' || '%'";
			}
		}
		sql += " ORDER BY BOARD_NO DESC) A)";
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit()-1;
		sql += " WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"),
						   rset.getString("board_title"),
						   rset.getString("user_id"),
						   rset.getInt("count"),
						   rset.getString("create_date"),
						   rset.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Reply> searchReplyList(Connection conn, PageInfo replyPi, String replySort, String replyKeyword){
		// select
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchReplyList");
		if(replyKeyword != null) {
			if(replySort.equals("content")) {
				// 내용검색
				sql += " AND REPLY_CONTENT LIKE '%' || '" + replyKeyword + "' || '%'";
			} else {
				// 작성자검색
				sql += " AND (SELECT USER_ID FROM MEMBER WHERE REPLY_WRITER = USER_NO) LIKE '%' || '" + replyKeyword + "' || '%'";
			}			
		}
		sql += " ORDER BY REPLY_NO DESC) A)";
		int startRow = (replyPi.getCurrentPage() - 1) * replyPi.getBoardLimit() + 1;
		int endRow = startRow + replyPi.getBoardLimit()-1;
		sql += " WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Reply(rset.getInt("reply_no"),
								   rset.getInt("board_no"),
								   rset.getString("user_id"),
								   rset.getString("reply_content"),
								   rset.getString("create_date"),
								   rset.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
}
