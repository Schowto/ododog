package com.odd.order.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.odd.member.model.vo.Member;
import com.odd.order.model.dao.OrderDao;
import com.odd.order.model.vo.Cart;
import com.odd.product.model.vo.Order;
import com.odd.product.model.vo.Product;
import com.odd.product.model.vo.UserProduct;

public class OrderService {

	private OrderDao dao = new OrderDao();

	public UserProduct productOrderList(int productNo) {

		Connection conn = getConnection();
		UserProduct p = new OrderDao().productOrderList(conn,productNo);
		close(conn);
		return p;

	}

	public List<Product> selectProductList(int[] proNo) {
		List<Product> list = new ArrayList<>();

		Connection conn = getConnection();
		list = dao.selectProductList(conn, proNo);
		close(conn);

		return list;
	}

	public int insertOrder(Order order) {
		Connection conn = getConnection();
		int result = dao.insertOrder(conn, order);

		if(result > 0) {
			commit(conn);

		}else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public int updatePoint(Member member, int point) {
		Connection conn = getConnection();
		int result = dao.updatePoint(conn, member, point);

		if(result > 0) {
			commit(conn);

		}else {
			rollback(conn);
		}

		close(conn);
		return result;
	}




}
