package com.odd.order.model.dao;

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
import com.odd.order.model.vo.AdminOrdSearch;
import com.odd.order.model.vo.AdminOrder;

public class AdminOrderDao {
	
	private Properties prop = new Properties();
	
	public AdminOrderDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdminOrderDao.class.getResource("/db/sql/adminOrder-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn){
		
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
	
	public ArrayList<AdminOrder> selectList(Connection conn, PageInfo pi, String order, String by){
		
		ArrayList<AdminOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		
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
										new AdminOrder(rset.getInt("주문번호")
												
												, rset.getString("상품이름")
												, rset.getInt("상품개수")
												
												, rset.getString("유저이름")
												, rset.getString("배송지")
												, rset.getString("휴대전화")
												, rset.getString("이메일")
												
												, rset.getInt("최종결제금액")
												
												, rset.getString("결제여부")
												, rset.getString("배송여부")
												
												, rset.getString("배송시요청사항")
												
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
	
	public ArrayList<AdminOrder> searchList(Connection conn, AdminOrdSearch ordSearch){

		ArrayList<AdminOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String proName = ordSearch.getProName();
		String userName = ordSearch.getUserName();
		String lowPrice = ordSearch.getLowPrice();
		String highPrice = ordSearch.getHighPrice();
		
		String sql = prop.getProperty("searchList");
		
		if(!proName.equals("")) {
			sql += " AND 상품이름 LIKE '%" + proName + "%'"; 
		}
		if(!userName.equals("")) {
			sql += " AND 유저이름 LIKE '%" + userName + "%'"; 
		}
		if(!lowPrice.equals("")) {
			sql += " AND 최종결제금액 >= " + lowPrice; 
		}
		if(!highPrice.equals("")) {
			sql += " AND 최종결제금액 <= " + highPrice;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(
							new AdminOrder(
									rset.getInt("주문번호"),
									
									rset.getString("상품이름"),
									rset.getInt("상품개수"),
									
									rset.getInt("유저번호"),
									rset.getString("유저이름"),
									rset.getString("배송지"),
									rset.getString("휴대전화"),
									rset.getString("이메일"),
									
									rset.getInt("사용적립금"),
									rset.getInt("최종결제금액"),
									rset.getDouble("적립률"),
									
									
									rset.getString("배송여부"),
									rset.getString("배송시요청사항")									
									)
						);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
		
		
	}

}
