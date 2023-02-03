package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.ProAtt;
import com.odd.product.model.vo.UserProduct;

public class ProductDetailDryService {

	public ArrayList<ProAtt> productDetail(int productNo){
		
		Connection conn = getConnection();
		ArrayList<ProAtt> list = new UserProductDao().detailDry(conn,productNo);
		close(conn);
		return list;  //상품상세테이블값
	}
	
	public UserProduct productDetailFood(int productNo){
		
		Connection conn = getConnection();
		UserProduct p = new UserProductDao().productDetailDry(conn,productNo);
		close(conn);
		return p;  //상품테이블값
	}
}

