package com.odd.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class ConsultDao {
	
	private Properties prop = new Properties();
	
	public ConsultDao() {
		try {
			prop.loadFromXML(new FileInputStream(ConsultDao.class.getResource("/db/sql/consult-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, String userId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
