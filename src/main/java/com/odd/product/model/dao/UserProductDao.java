package com.odd.product.model.dao;

import static com.odd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.odd.product.model.vo.UserProduct;


public class UserProductDao {
	private Properties prop = new Properties();
	
	public UserProductDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(UserProductDao.class.getResource("/db/sql/userProduct-mapper.xml").getPath()));
	
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<UserProduct> selectFoodList(Connection conn){
		ArrayList<UserProduct> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		
		String sql = prop.getProperty("selectFoodList");
		
		try {
			pstmt = conn.prepareStatement(sql); //완성 sql문
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new UserProduct(rset.getString("pro_name"),
										rset.getInt("price"),
										rset.getString("thumb_img")
										
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
	
	public ArrayList<UserProduct> selectDryList(Connection conn){
		ArrayList<UserProduct> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		
		String sql = prop.getProperty("selectDryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new UserProduct(rset.getString("pro_name"),
										rset.getInt("price"),
										rset.getString("thumb_img")
										
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
	
	public ArrayList<UserProduct> selectOvenList(Connection conn){
		ArrayList<UserProduct> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		
		String sql = prop.getProperty("selectOvenList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new UserProduct(rset.getString("pro_name"),
										rset.getInt("price"),
										rset.getString("thumb_img")
										
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
	
	public ArrayList<UserProduct> selectPartyList(Connection conn){
		ArrayList<UserProduct> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		
		String sql = prop.getProperty("selectPartyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new UserProduct(rset.getString("pro_name"),
										rset.getInt("price"),
										rset.getString("thumb_img")
										
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
	
	public UserProduct selectProductDetail(Connection conn, String proName, int price) {
			//select =>ResultSet객체
			UserProduct p = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql =  prop.getProperty("detailProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, proName);
				pstmt.setInt(2, price);
				
				rset= pstmt.executeQuery();
				
				if(rset.next()) {
					p = new UserProduct(rset.getString("PRO_NAME"),
									rset.getInt("PRICE"));
					
				}
				
	
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return p;
			
		
	}
	
}
