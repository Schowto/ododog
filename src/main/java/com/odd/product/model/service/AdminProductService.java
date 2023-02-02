package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.common.model.vo.PageInfo;
import com.odd.product.model.dao.AdminProductDao;
import com.odd.product.model.vo.AdminProSearch;
import com.odd.product.model.vo.ProAtt;
import com.odd.product.model.vo.Product;

public class AdminProductService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int result = new AdminProductDao().selectListCount(conn);
		close(conn);
		
		return result;
	}
	
	public ArrayList<Product> selectList(PageInfo pi, String order, String by){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new AdminProductDao().selectList(conn, pi, order, by);
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> searchList(AdminProSearch proSearch){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new AdminProductDao().searchList(conn, proSearch);
		close(conn);
		
		return list;
	}
	
	public int insertProduct (Product p, ArrayList<ProAtt> list) {
		
		Connection conn = getConnection();

		int result1 = new AdminProductDao().insertProduct(conn, p);
		int result2 = new AdminProductDao().insertAttachList(conn, list);
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}
	
	public int deleteProduct(String[] deleteList) {
		Connection conn = getConnection();
		
		int result1 = new AdminProductDao().deleteProduct(conn, deleteList);
		int result2 = new AdminProductDao().deleteProAtt(conn, deleteList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public Product selectProduct(int proNo) {
		Connection conn = getConnection();
		
		Product p = new AdminProductDao().selectProduct(conn, proNo);
		close(conn);
		
		return p;
	}
	
	public ArrayList<ProAtt> selectProAtt(int proNo){
		Connection conn = getConnection();
		
		ArrayList<ProAtt> list = new AdminProductDao().selectProAtt(conn, proNo);
		close(conn);
		
		return list;
	}
	
	public int updateProduct(Product p, ArrayList<ProAtt> list) {
		
		Connection conn = getConnection();

		int result1 = new AdminProductDao().updateProduct(conn, p);
		int result2 = new AdminProductDao().updateAttachList(conn, list);
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}
	
}
