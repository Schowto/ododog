package com.odd.order.model.dao;

import static com.odd.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.odd.member.model.vo.Member;
import com.odd.order.model.vo.Cart;
import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.Product;
import com.odd.product.model.vo.UserProduct;

public class CartDao {
private Properties prop = new Properties();

	public CartDao() {

		try {
			prop.loadFromXML(new FileInputStream(UserProductDao.class.getResource("/db/sql/userOrder-mapper.xml").getPath()));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertCart(Connection conn, Cart cart) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCart");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cart.getMember().getUser_No());
			pstmt.setInt(2, cart.getProduct().getProNo());
			pstmt.setInt(3, cart.getCartQty());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int selectOneCartNoByUserNo(Connection conn, Cart cart) {
		int cartNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneCartNoByUserNo");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getMember().getUser_No());
			pstmt.setInt(2, cart.getProduct().getProNo());

			rset = pstmt.executeQuery();

			if(rset.next()) {
				cartNo = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return cartNo;
	}

	public int updateCart(Connection conn, Cart cart) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCart");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cart.getCartQty());
			pstmt.setInt(2, cart.getCartNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public List<Cart> selectCartList(Connection conn, Member member) {
		List<Cart> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCartList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getUser_No());

			rset = pstmt.executeQuery();

			while(rset.next()) {
				Cart cart = new Cart();
			//	CART_NO	USER_NO	PRO_NO	CART_QTY
				cart.setCartNo(rset.getInt("CART_NO"));
				cart.setCartQty(rset.getInt("cart_qty"));

				Product product = new Product();
				product.setProNo(rset.getInt("pro_no"));
				product.setProName(rset.getString("pro_name"));
				product.setPrice(rset.getInt("price"));
				product.setSave(rset.getDouble("save"));
				product.setThumbImg(rset.getString("thumb_img"));

				cart.setProduct(product);

				list.add(cart);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deleteCart(Connection conn, int cartNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCart");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cartNo);


			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertPick(Connection conn, Member member, int proNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPick");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, proNo);
			pstmt.setInt(2, member.getUser_No());


			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int selectOnePick(Connection conn, Member member, int proNo) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOnePick");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			pstmt.setInt(2, member.getUser_No());

			rset = pstmt.executeQuery();

			if(rset.next()) {
				count = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	public int deletePick(Connection conn, Member member, int proNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deletePick");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, proNo);
			pstmt.setInt(2, member.getUser_No());


			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteAllCart(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAllCart");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, member.getUser_No());


			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
