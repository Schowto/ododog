package com.odd.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.odd.common.JDBCTemplate.*;

import com.odd.board.model.vo.FAQ;

public class FAQDao {
	
	private Properties prop = new Properties();
	
	public FAQDao() {
		try {
			prop.loadFromXML(new FileInputStream(FAQDao.class.getResource("/db/sql/FAQ-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<FAQ> selectFAQList(Connection conn){
		ArrayList<FAQ> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFAQList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				FAQ faq = new FAQ();
				faq.setContactNo(rset.getInt("contact_no"));
				faq.setCategory(rset.getString("category"));
				faq.setContactTitle(rset.getString("contact_title"));
				faq.setContactAnswer(rset.getString("contact_answer"));
				list.add(faq);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertFAQ(Connection conn, FAQ f) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getContactTitle());
			pstmt.setString(2, f.getContactAnswer());
			pstmt.setString(3, f.getCategory());
			pstmt.setInt(4, f.getFaqWriter());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public FAQ selectFAQ(Connection conn, int contactNo) {
		FAQ f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contactNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				f = new FAQ(rset.getInt("contact_no"),
							rset.getString("category"),
							rset.getString("contact_title"),
							rset.getString("contact_answer")
						);			
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return f;
	}
	public int updateFAQ(Connection conn, FAQ f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getCategory());
			pstmt.setString(2, f.getContactTitle());
			pstmt.setString(3, f.getContactAnswer());
			pstmt.setInt(4, f.getContactNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int deleteFAQ(Connection conn, int contactNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contactNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		 return result;
		
		
	}

}
