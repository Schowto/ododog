package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import static com.odd.common.JDBCTemplate.*;
import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.ProductDetail;

public class ProductDetailService {

	public ProductDetail selectProductDetail(String proName, int price) {
		
		Connection conn = getConnection();
		ProductDetail p = new UserProductDao().selectProductDetail(conn, proName, price);
		close(conn);
		return p;
	}
}
