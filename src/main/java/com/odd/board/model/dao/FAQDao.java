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
				list.add(new FAQ(rset.getString("category"),
								 rset.getString("contactTitle"),
								 rset.getString("contactAnswer")
								 ));
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
