package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.ProAtt;


public class ProductDetailService {

	public ArrayList<ProAtt> productDetail(int productNo){
		
		Connection conn = getConnection();
		ArrayList<ProAtt> list = new UserProductDao().productDetail(conn);
		close(conn);
		return list;
	}
}
