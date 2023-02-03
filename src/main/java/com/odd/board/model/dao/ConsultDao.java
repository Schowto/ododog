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
	public ArrayList<Consult> selectList(Connection conn, PageInfo pi, int userNo) {

		ArrayList<Consult> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("slectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Consult(rset.getInt("counsult_no"),
									 rset.getString("consult_title"),
									 rset.getDate("enroll_date"),
									 rset.getString("consult_category"),
									 rset.getString("answer_status")
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
	public ArrayList<Consult> selectAllConsult(Connection conn, int userNo){
		
		ArrayList<Consult> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllConsult");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Consult(rset.getInt("consult_no"),
									 rset.getString("user_Id"),
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
									 rset.getInt("respondents"),
									 rset.getString("answer_status")
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
	 * 맞춤상담 등록
	 * @param conn
	 * @param userNo
	 * @param c
	 * @return
	 */
	public int insertConsult(Connection conn, int userNo, Consult c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertConsult");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  userNo);
			pstmt.setString(2, c.getConsultTitle());
			pstmt.setString(3, c.getConsultContent());
			pstmt.setString(4, c.getOriginName());
			pstmt.setString(5, c.getFilePath());
			pstmt.setString(6, c.getConsultCategory());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public Consult selectConsult(Connection conn, int consultNo) {
		
		Consult c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectConsult");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, consultNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Consult(rset.getInt("consult_no"),
						        rset.getString("user_no"),
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
						        rset.getInt("respondents"),
						        rset.getString("answer_status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
		
	}
	
	public int updateConsult(Connection conn, int consultNo, Consult c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateConsult");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getConsultTitle());
			pstmt.setString(2, c.getConsultCategory());
			pstmt.setString(3, c.getConsultContent());
			pstmt.setString(4, c.getOriginName());
			pstmt.setString(5, c.getFilePath());
			pstmt.setInt(6, c.getConsultNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteConsult(Connection conn, int consultNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteConsult");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, consultNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int consultAnswer(Connection conn, int consultNo, String consultAnswer) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("consultAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, consultAnswer);
			pstmt.setInt(2, consultNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	
	
	
	

}
