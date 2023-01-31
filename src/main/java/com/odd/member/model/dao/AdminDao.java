package com.odd.member.model.dao;

import static com.odd.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.odd.member.model.vo.Admin;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		String filePath = AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Admin loginAdmin(Connection conn, String adminId, String password) {
		Admin a = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminId);
			pstmt.setString(2, password);
			
			rset = pstmt.executeQuery(); 
			
			if(rset.next()) {
				a = new Admin(rset.getInt("ADMIN_NO"),
							   rset.getString("ADMIN_ID"),
							   rset.getString("PASSWORD")
							   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return a;
	}
}	
