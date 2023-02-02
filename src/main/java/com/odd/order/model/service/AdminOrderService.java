package com.odd.order.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.common.model.vo.PageInfo;
import com.odd.order.model.dao.AdminOrderDao;
import com.odd.order.model.vo.AdminOrder;

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

}
