package com.odd.order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.odd.order.model.vo.Order;
import com.odd.product.model.vo.UserProduct;

public class OrderSendDao {
	private Properties prop = new Properties();

	public OrderSendDao() {

		try {
			prop.loadFromXML(new FileInputStream(OrderSendDao.class.getResource("/db/sql/Order-mapper.xml").getPath()));

		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
		public int insertOrderList(Connection conn, Order o) {
			int result=0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("sendOrderList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, o.getUserNo());
				pstmt.setString(2, o.getDelAdd());
				pstmt.setString(3, o.getPhone());
				pstmt.setString(4, o.getEmail());
				pstmt.setString(6, o.getRequire());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
			
		}
	}	

