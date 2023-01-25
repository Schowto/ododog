package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.common.model.vo.PageInfo;
import com.odd.product.model.dao.AdminProductDao;
import com.odd.product.model.vo.AdminProSearch;
import com.odd.product.model.vo.Product;

public class AdminProductService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int result = new AdminProductDao().selectListCount(conn);
		close(conn);
		
		return result;
	}
	
	public ArrayList<Product> selectList(PageInfo pi, String order){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new AdminProductDao().selectList(conn, pi, order);
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> searchList(AdminProSearch proSearch){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new AdminProductDao().searchList(conn, proSearch);
		close(conn);
		
		return list;
	}
	
}
