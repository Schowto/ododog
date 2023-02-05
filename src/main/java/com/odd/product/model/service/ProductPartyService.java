package com.odd.product.model.service;

import static com.odd.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.UserProduct;

public class ProductPartyService {

	public ArrayList<UserProduct> selectPartyList() {
		Connection conn = getConnection();
		ArrayList<UserProduct> list = new UserProductDao().selectPartyList(conn); 
		close(conn);
		return list;
	}
	
	public ArrayList<UserProduct> orderbyParty() {
		Connection conn = getConnection();
		ArrayList<UserProduct> list = new UserProductDao().selectPartyList(conn); 
		close(conn);
		return list;
	}
	
}
