package com.odd.order.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.commit;
import static com.odd.common.JDBCTemplate.getConnection;
import static com.odd.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.odd.member.model.vo.Member;
import com.odd.order.model.dao.CartDao;
import com.odd.order.model.dao.OrderDao;
import com.odd.order.model.vo.Cart;
import com.odd.product.model.vo.Product;

public class CartService {

	private CartDao dao = new CartDao();

	public int insertCart(Cart cart) {
		Connection conn = getConnection();
		int result = dao.insertCart(conn, cart);

		if(result > 0) {
			commit(conn);

		}else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public int selectOneCartNoByUserNo(Cart cart) {
		Connection conn = getConnection();
		int cartNo = dao.selectOneCartNoByUserNo(conn, cart);
		close(conn);

		return cartNo;
	}

	public int updateCart(Cart cart) {
		Connection conn = getConnection();
		int result = dao.updateCart(conn, cart);

		if(result > 0) {
			commit(conn);

		}else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public List<Cart> selectCartList(Member member) {
		List<Cart> list = new ArrayList<>();

		Connection conn = getConnection();
		list = dao.selectCartList(conn, member);
		close(conn);

		return list;
	}

	public int deleteCart(int cartNo) {
		Connection conn = getConnection();
		int result = dao.deleteCart(conn, cartNo);

		if(result > 0) {
			commit(conn);

		}else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public int insertPick(Member member, int proNo) {
		Connection conn = getConnection();
		int result = dao.insertPick(conn, member, proNo);

		if(result > 0) {
			commit(conn);

		}else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public int selectOnePick(Member member, int proNo) {
		Connection conn = getConnection();
		int count = 0;

		count = dao.selectOnePick(conn, member, proNo);
		close(conn);

		return count;
	}

	public int deletePick(Member member, int proNo) {
		Connection conn = getConnection();
		int result = dao.deletePick(conn, member, proNo);

		if(result > 0) {
			commit(conn);

		}else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public int deleteAllCart(Member member) {
		Connection conn = getConnection();
		int result = dao.deleteAllCart(conn, member);

		if(result > 0) {
			commit(conn);

		}else {
			rollback(conn);
		}

		close(conn);
		return result;
	}
}
