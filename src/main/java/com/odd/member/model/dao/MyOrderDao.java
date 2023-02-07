package com.odd.member.model.dao;

import static com.odd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.sql.Date;

import com.odd.member.model.dao.ReviewDao;
import com.odd.member.model.vo.MyOrder;
import com.odd.product.model.vo.Order;

public class MyOrderDao {
	
private Properties prop = new Properties();
	
	public MyOrderDao() {
		String filePath = ReviewDao.class.getResource("/db/sql/myOrder-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 내주문전체조회 (정은)
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public ArrayList<MyOrder> selectAllMyOrder(Connection conn, int userNo) {
		ArrayList<MyOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllMyOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MyOrder(rset.getInt("ord_no"),
									 rset.getInt("user_no"),
									 rset.getString("del_add"),
									 rset.getString("payment"),
								     rset.getString("delivery"),
								     rset.getString("phone"),
								     rset.getString("address"),
								     rset.getString("require"),
								     rset.getDate("order_date")
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
	
	public MyOrder selectMyOrder(Connection conn, int ordNo) {
		MyOrder m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ordNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new MyOrder(rset.getInt("ord_no"),
									 rset.getInt("pro_no"),
									 rset.getInt("user_no"),
									 rset.getString("del_add"),
									 rset.getString("payment"),
								     rset.getString("delivery"),
								     rset.getString("phone"),
								     rset.getString("address"),
								     rset.getString("require"),
								     rset.getDate("order_Date"),
								     rset.getString("thumb_img"),
								     rset.getString("pro_name"),
								     rset.getInt("price"),
								     rset.getInt("amount"),
								     rset.getString("user_id"),
								     rset.getString("user_name"),
								     rset.getInt("total_price"),
								     rset.getInt("delivery"),
								     rset.getInt("discount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	

}
