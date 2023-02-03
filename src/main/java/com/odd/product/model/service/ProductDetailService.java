package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.ProAtt;
import com.odd.product.model.vo.Product;
import com.odd.product.model.vo.UserProduct;


public class ProductDetailService {

	public ArrayList<ProAtt> productDetail(int productNo){
		
		Connection conn = getConnection();
		ArrayList<ProAtt> list = new UserProductDao().productDetail(conn,productNo);
		close(conn);
		return list;  //상품상세테이블값
	}
	
	public UserProduct productDetailFood(int productNo){
		
		Connection conn = getConnection();
		UserProduct p = new UserProductDao().productDetailFood(conn,productNo);
		close(conn);
		return p;  //상품테이블값
	
}
}