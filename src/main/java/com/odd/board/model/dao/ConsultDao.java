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

import com.odd.board.model.vo.Consult;
import com.odd.common.model.vo.PageInfo;

public class ConsultDao {
	
	private Properties prop = new Properties();
	
	public ConsultDao() {
		try {
			prop.loadFromXML(new FileInputStream(ConsultDao.class.getResource("/db/sql/consult-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 페이징처리
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Consult> selectList(Connection conn, PageInfo pi, String userId) {

		ArrayList<Consult> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("slectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Consult(rset.getInt("counsult_no"),
									 rset.getString("consult_title"),
									 rset.getString("user_id"),
									 rset.getDate("enroll_date"),
									 rset.getString("status")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	/**
	 * 맞춤상담 총 갯수
	 * @param conn
	 * @param userId
	 */
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	/**
	 * 맞춤상담 총 조회
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<Consult> selectConsult(Connection conn, String userId){
		
		ArrayList<Consult> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectConsult");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Consult(rset.getInt("consult_no"),
									 rset.getInt("user_no"),
									 rset.getString("consult_title"),
									 rset.getString("consult_content"),
									 rset.getDate("enroll_date"),
									 rset.getDate("modify_date"),
									 rset.getString("consult_answer"),
									 rset.getDate("answer_date"),
									 rset.getString("status"),
									 rset.getString("origin_name"),
									 rset.getString("file_path"),
									 rset.getString("consult_category"),
									 rset.getInt("respondents")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
