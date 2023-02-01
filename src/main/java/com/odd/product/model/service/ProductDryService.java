package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.UserProduct;

public class ProductDryService {
	
	public ArrayList<UserProduct> selectDryList() {
		Connection conn = getConnection();
		ArrayList<UserProduct> list = new UserProductDao().selectDryList(conn); 
		close(conn);
		return list;
		
	}
	
}
