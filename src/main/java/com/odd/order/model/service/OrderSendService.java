package com.odd.order.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.odd.order.model.dao.OrderSendDao;
import com.odd.order.model.vo.Order;

public class OrderSendService {

	public int insertOrderList(Order o) {
		// 결제 api넘어가는 값
		Connection conn = getConnection();
		
		int result = new OrderSendDao().insertOrderList(conn, o); 
		close(conn);		
		
		return result;
	}
}
