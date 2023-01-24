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

import com.odd.common.model.vo.PageInfo;
import com.odd.product.model.vo.ProSearch;
import com.odd.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Product> selectList(Connection conn, PageInfo pi, String order){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		String by = "DESC";
		
		if(order.equals("EXPIRED_DATE")) {
			by = "ASC";
		}
		
		String sql = prop.getProperty("selectList1") + " ORDER BY " + order +" " + by + " " + prop.getProperty("selectList2"); ;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() + -1;
		
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			
             while(rset.next()){	
								list.add(
										new Product(rset.getInt("pro_no")
												, rset.getString("category")
												, rset.getString("pro_name")
												, rset.getInt("price")
												, rset.getString("soldout")
												, rset.getString("expired_date")
												, rset.getString("ENROLL_DATE")
												, rset.getDouble("SAVE")
												, rset.getString("thumb_img")
												)
										);
             					}
						
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<Product> searchList(Connection conn, ProSearch proSearch) {
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearch");
		String proName = proSearch.getProName();
		String category = proSearch.getCategory();
		String soldout = proSearch.getSoldout();
		
		
		if(!proName.equals("")) {
			sql += " AND PRO_NAME LIKE '%" + proName + "%'"; 
		}
		if(!category.equals("전체")) {
			sql += " AND CATEGORY = '" + category +"'";
		}
		if(!category.equals("all")) {
			sql += " AND SOLDOUT = '" + soldout +"'";
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			
			rset = pstmt.executeQuery();
			
			
             while(rset.next()){	
								list.add(
										new Product(rset.getInt("pro_no")
												, rset.getString("category")
												, rset.getString("pro_name")
												, rset.getInt("price")
												, rset.getString("soldout")
												, rset.getString("expired_date")
												, rset.getString("ENROLL_DATE")
												, rset.getDouble("SAVE")
												, rset.getString("thumb_img")
												)
										);
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
