package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.UserProduct;

public class ProductOvenService {

	public ArrayList<UserProduct> selectOvenList(){
		Connection conn = getConnection();
		ArrayList<UserProduct> list = new UserProductDao().selectOvenList(conn);
		close(conn);
		return list;
	}
}
