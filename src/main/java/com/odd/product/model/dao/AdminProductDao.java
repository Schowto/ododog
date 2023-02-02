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
import com.odd.product.model.vo.AdminProSearch;
import com.odd.product.model.vo.ProAtt;
import com.odd.product.model.vo.Product;

public class AdminProductDao {
	
	private Properties prop = new Properties();
	
	public AdminProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdminProductDao.class.getResource("/db/sql/adminProduct-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * @return 전체 상품 개수
	 */
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

	/**
	 * @param pi >> 페이지 처리 정보
	 * @param order >> 정렬 기준
	 * @param by >>  오름차순/내림차순
	 * @return 현재 페이지에 들어갈 상품 리스트
	 */
	public ArrayList<Product> selectList(Connection conn, PageInfo pi, String order, String by){
		
		ArrayList<Product> list = new ArrayList<>();
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
	
	/**
	 * @param conn
	 * @param proSearch >> 검색 조건 객체
	 * @return 검색된 상품 리스트
	 */
	public ArrayList<Product> searchList(Connection conn, AdminProSearch proSearch) {
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearch");
		String proName = proSearch.getProName();
		String category = proSearch.getCategory();
		String soldout = proSearch.getSoldout();
		String expDateRemain = proSearch.getExpDateRemain();
		String lowPrice = proSearch.getLowPrice();
		String highPrice = proSearch.getHighPrice();
		String firstDate = proSearch.getFirstDate();
		String secondDate = proSearch.getSecondDate();
		
		if(!proName.equals("")) {
			sql += " AND PRO_NAME LIKE '%" + proName + "%'"; 
		}
		if(!category.equals("전체")) {
			sql += " AND CATEGORY = '" + category +"'";
		}
		if(!soldout.equals("all")) {
			sql += " AND SOLDOUT = '" + soldout +"'";
		}
		if(!expDateRemain.equals("1")) {
			sql += " AND EXP_DATE < " + expDateRemain;
		}
		if(!lowPrice.equals("")) {
			sql += " AND PRICE >= "
				 + lowPrice;
		}
		if(!highPrice.equals("")) {
			sql += " AND PRICE <= "
					+ highPrice;
		}
		if(!firstDate.equals("")) {
			sql += " AND ENR_DATE >= TO_DATE('"
				 + firstDate + "', 'YYYY-MM-DD')";
		}
		if(!secondDate.equals("")) {
			sql += " AND ENR_DATE <= TO_DATE('"
					+ secondDate + "', 'YYYY-MM-DD')";
		}
		
		System.out.println(firstDate);
		
		
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
	
	// 상품 등록
	public int insertProduct(Connection conn, Product p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getCategory());
			pstmt.setString(2, p.getProName());
			pstmt.setInt(3, p.getPrice());
			pstmt.setString(4, p.getExpiredDate());
			pstmt.setString(5, p.getThumbImg());
			pstmt.setString(6, String.valueOf(p.getSave()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 상품 이미지 등록
	public int insertAttachList(Connection conn, ArrayList<ProAtt> list) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachList");
		
		try {
			for(ProAtt at : list) {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getFilePath());
				pstmt.setInt(2, at.getFileLevel());
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * @param deleteList >> 삭제할 상품 번호 배열
	 * @return result >> 상품 삭제 결과  
	 */
	public int deleteProduct(Connection conn, String[] deleteList) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteProduct");
		
		try {
			for(String no : deleteList) {

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(no));
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * @param deleteList >> 삭제할 상품 번호 배열
	 * @return result >> 상품 삭제 결과  
	 */
	public int deleteProAtt(Connection conn, String[] deleteList) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteProAtt");
		
		try {
			
			for(String no : deleteList) {

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(no));
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * @param proNo >> 클릭한 상품 번호
	 * @return 번호로 조회한 상품 정보
	 */
	public Product selectProduct(Connection conn, int proNo) {
		
		Product p = null;
		ResultSet rset = null;
		PreparedStatement pstmt= null;
		
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, proNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){	
							p = new Product(rset.getInt("pro_no")
									, rset.getString("category")
									, rset.getString("pro_name")
									, rset.getInt("price")
									, rset.getString("soldout")
									, rset.getString("expired_date")
									, rset.getString("ENROLL_DATE")
									, rset.getDouble("SAVE")
									, rset.getString("thumb_img")
									);
							}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
	}
	
	/**
	 * @param proNo >> 클릭한 상품 번호
	 * @return 번호로 조회한 상품 이미지 리스트
	 */
	public ArrayList<ProAtt> selectProAtt(Connection conn, int proNo){
		
		ResultSet rset = null;
		ArrayList<ProAtt> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectProAtt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, proNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){	
				list.add(
						new ProAtt(rset.getInt("FILE_NO")
								, rset.getInt("PRO_NO")
								, rset.getString("FILE_PATH")
								, rset.getInt("FILE_LEVEL")
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
	
	// 상품 정보 수정
	public int updateProduct(Connection conn, Product p) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("updateProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, p.getCategory());
				pstmt.setString(2, p.getProName());
				pstmt.setInt(3, p.getPrice());
				pstmt.setString(4, p.getExpiredDate());
				pstmt.setString(5, p.getThumbImg());
				pstmt.setString(6, String.valueOf(p.getSave()));
				pstmt.setString(7, p.getSoldout());
				pstmt.setInt(8, p.getProNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
	
	// 상품 이미지 수정
	public int updateAttachList(Connection conn, ArrayList<ProAtt> list) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttachList");
		
		try {
			for(ProAtt at : list) {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getFilePath());
				pstmt.setInt(2, at.getFileNo());
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
}
