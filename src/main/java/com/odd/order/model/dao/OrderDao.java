package com.odd.order.model.dao;

import static com.odd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.UserProduct;

public class OrderDao {

private Properties prop = new Properties();
	
	public OrderDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(UserProductDao.class.getResource("/db/sql/userProduct-mapper.xml").getPath()));
	
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public UserProduct productFoodOrder(Connection conn){
		UserProduct p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("orderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				p = new UserProduct(	rset.getInt("pro_no"),
						rset.getString("pro_name"),
						rset.getInt("price"),
						rset.getString("thumb_img")
									
										
										
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
		
	}
	
}
