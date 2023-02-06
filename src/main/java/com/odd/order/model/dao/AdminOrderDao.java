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
import com.odd.order.model.vo.OrdPro;

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
		

		String userName = ordSearch.getUserName();
		String lowPrice = ordSearch.getLowPrice();
		String highPrice = ordSearch.getHighPrice();
		String require = ordSearch.getRequire();
		
		String sql = prop.getProperty("searchList");
		
	
		if(!userName.equals("")) {
			sql += " AND 유저이름 LIKE '%" + userName + "%'"; 
		}
		if(!require.equals("")) {
			sql += " AND 배송시요청사항 LIKE '%" + require + "%'"; 
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
								
									rset.getInt("유저번호"),
									rset.getString("유저이름"),
									rset.getString("배송지"),
									rset.getString("휴대전화"),
									rset.getString("이메일"),
									
									rset.getInt("사용적립금"),
									rset.getInt("최종결제금액"),
									
									
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
	
	/**  주문 정보 조회 (상품정보제외) 
	 * 
	 * @param ordNo -- > 상품 번호
	 * @return AdminOrder -- 주문 정보
	 *          >> 주문번호 ordNo
	 *          >> 회원번호 userNo
	 *          >> 회원이름 userName
	 *          >> 배송지 delAdd
	 *          >> 전화번호 phone
	 *          >> 이메일 email
	 *          >> 사용적립금 discount
	 *          >> 최종결제금액 totalPrice
	 *          >> 배송여부('Y' or 'N') delivery
	 *          >> 입금여부('Y' or 'N') payment
	 *          >> 배송시요구사항 require
	 *          >> 회원주소 address
	 *          >> 배송비 deliveryPrice
	 *          >> 주문등록날짜 orderDate
	 */
	public AdminOrder selectOrder(Connection conn, int ordNo) {
			
			AdminOrder o = null;
			ResultSet rset = null;
			PreparedStatement pstmt= null;
			
			String sql = prop.getProperty("selectOrder");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, ordNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){	
							o = new AdminOrder(rset.getInt("주문번호")
									, rset.getInt("회원번호")
									, rset.getString("회원이름")
									, rset.getString("배송지")
									, rset.getString("전화번호")
									, rset.getString("이메일")
									, rset.getInt("사용적립금")
									, rset.getInt("최종결제금액")
									, rset.getString("배송여부")
									, rset.getString("배송시요구사항")
									);
					
							o.setPayment(rset.getString("입금여부"));
							o.setDeliveryPrice(rset.getInt("배송비"));
							o.setAddress(rset.getString("회원주소"));
							o.setOrderDate(rset.getString("주문등록날짜"));
							
								
								}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return o;
			
		}
		
	
		/** 주문별 상품정보 조회
		 * 
		 * @param ordNo
		 * @return list -- 상품 정보
		 * 			>> ordProNo 인덱스
		 * 
		 * 			>> ordNo 주문 번호
		 * 
		 * 			>> proNo 상품 번호
		 *          >> proName 상품 이름
		 *          >> price 상품 가격 
		 *          >> thumbImg 섬네일 이미지
		 *          >> category 카테고리
		 *          >> save 적립률
		 * 			>> amount 상품 수량
		 * 
		 */
		public ArrayList<OrdPro> selectOrdPro(Connection conn, int ordNo){
			
			ResultSet rset = null;
			ArrayList<OrdPro> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			OrdPro op = null;
			
			String sql = prop.getProperty("selectOrdPro");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, ordNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){	
							op = new OrdPro(rset.getInt("ord_Pro_No")
									, rset.getInt("ord_No")
									, rset.getInt("pro_No")
									, rset.getInt("amount")
									);
							
							op.setProName(rset.getString("pro_name"));
							op.setPrice(rset.getInt("price"));
							op.setThumbImg(rset.getString("thumb_Img"));
							op.setCategory(rset.getString("category"));
							op.setSave(rset.getDouble("save"));
							
							list.add(op);
							
						}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}
		
		public int confirmOrder(Connection conn, int ordNo) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("confirmOrder");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, ordNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return result;
		}
		
		public int confirmMemberSP(Connection conn, int userNo, int point) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("confirmMemberSP");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, point);
				pstmt.setInt(2, userNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
		
		
		public int confirmMemberDC(Connection conn, int userNo, int point) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			
			
			String sql = prop.getProperty("confirmMemberDC");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, point);
				pstmt.setInt(2, userNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
		
		public int confirmPoint(Connection conn, int ordNo, int userNo, int point, String pm) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			
			
			String sql = prop.getProperty("confirmPoint");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,pm);
				pstmt.setString(2,pm);
				pstmt.setInt(3, point);
				pstmt.setInt(4, userNo);
				pstmt.setInt(5, ordNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
			
		}
		
}
