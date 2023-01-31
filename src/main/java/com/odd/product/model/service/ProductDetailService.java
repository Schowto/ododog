package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import static com.odd.common.JDBCTemplate.*;
import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.Product;

public class ProductDetailService {

	public Product selectProductDetail(String proName, int price) {
		
		Connection conn = getConnection();
		Product p = new UserProductDao().selectProductDetail(conn, proName, price);
		close(conn);
		return p;
	}
}
