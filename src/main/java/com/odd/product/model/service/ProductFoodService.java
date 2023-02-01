package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.UserProduct;

public class ProductFoodService {

	public ArrayList<UserProduct> selectFoodList(){
		Connection conn = getConnection();
		ArrayList<UserProduct> list = new UserProductDao().selectFoodList(conn); 
		close(conn);
		return list;
	}
}
 

