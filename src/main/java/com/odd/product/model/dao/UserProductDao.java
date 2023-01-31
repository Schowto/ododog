package com.odd.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.odd.product.model.vo.Product;
import static com.odd.common.JDBCTemplate.*;

public class UserProductDao {
	private Properties prop = new Properties();
	
	public UserProductDao() {
		String filePath = UserProductDao.class.getResource("/db/sql/userProduct-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Product selectProductDetail(Connection conn, String proName, int price) {
			//select =>ResultSet객체
			Product p = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql =  prop.getProperty("detailProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, proName);
				pstmt.setInt(2, price);
				rset= pstmt.executeQuery();
				
				
	
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return p;
			
		
	}
	
}
