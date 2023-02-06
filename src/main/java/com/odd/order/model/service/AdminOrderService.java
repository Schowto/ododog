package com.odd.order.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.common.model.vo.PageInfo;
import com.odd.order.model.dao.AdminOrderDao;
import com.odd.order.model.vo.AdminOrdSearch;
import com.odd.order.model.vo.AdminOrder;
import com.odd.order.model.vo.OrdPro;

public class AdminOrderService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int result = new AdminOrderDao().selectListCount(conn);
		close(conn);
		
		return result;
		
	}
	
	
	public ArrayList<AdminOrder> selectList(PageInfo pi, String order, String by){
		
		Connection conn = getConnection();
		
		ArrayList<AdminOrder> list = new AdminOrderDao().selectList(conn, pi, order, by);
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<AdminOrder> searchList(AdminOrdSearch ordSearch){
		
		Connection conn = getConnection();
		
		ArrayList<AdminOrder> list = new AdminOrderDao().searchList(conn, ordSearch);
		close(conn);
		
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
	public AdminOrder selectOrder(int ordNo) {
		Connection conn = getConnection();
		
		AdminOrder o = new AdminOrderDao().selectOrder(conn, ordNo);
		close(conn);
		
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
	public ArrayList<OrdPro> selectOrdPro(int ordNo){
		Connection conn = getConnection();
		
		ArrayList<OrdPro> list = new AdminOrderDao().selectOrdPro(conn, ordNo);
		close(conn);
		
		return list;
	}
	
	public int confirmOrder(int ordNo, int userNo, int savePoint, int discount) {

		Connection conn = getConnection();
		
		int result1 = new AdminOrderDao().confirmOrder(conn, ordNo);
		int result2 = new AdminOrderDao().confirmMemberSP(conn, userNo, savePoint);
		int result3 = new AdminOrderDao().confirmMemberDC(conn, userNo, discount);
		
		int result5 = 1;
		if(discount > 0) {
			result5 = new AdminOrderDao().confirmPoint(conn, ordNo, userNo, discount, "사용");
		}
		
		int result4 = 1;
		if(savePoint > 0) {
			result4 = new AdminOrderDao().confirmPoint(conn, ordNo, userNo, savePoint, "적립");
		}
		
		if(result1 > 0 && result2 >0 && result3 >0 && result4 >0 && result5 >0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1*result2*result3*result4*result5;
		
	}

}
