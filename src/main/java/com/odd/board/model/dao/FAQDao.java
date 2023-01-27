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
		System.out.println(conn);
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

}
