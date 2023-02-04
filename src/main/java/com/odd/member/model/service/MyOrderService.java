package com.odd.member.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.member.model.dao.MyOrderDao;
import com.odd.member.model.vo.MyOrder;

public class MyOrderService {

	public ArrayList<MyOrder> selectAllMyOrder(int userNo) {
		Connection conn = getConnection();
		ArrayList<MyOrder> list = new MyOrderDao().selectAllMyOrder(conn, userNo);
		close(conn);
		return list;
		
	}
	
	public MyOrder selectMyOrder(int ordNo) {
		Connection conn = getConnection();
		MyOrder m = new MyOrderDao().selectMyOrder(conn, ordNo);
		close(conn);
		return m;
	}
	
	
	
	
	
}
