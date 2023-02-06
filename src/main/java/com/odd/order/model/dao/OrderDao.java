package com.odd.order.model.dao;

import static com.odd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.odd.member.model.vo.Member;
import com.odd.order.model.vo.Cart;
import com.odd.product.model.dao.UserProductDao;
import com.odd.product.model.vo.Order;
import com.odd.product.model.vo.Product;
import com.odd.product.model.vo.UserProduct;

public class OrderDao {

private Properties prop = new Properties();

	public OrderDao() {

		try {
			prop.loadFromXML(new FileInputStream(UserProductDao.class.getResource("/db/sql/userProduct-mapper.xml").getPath()));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public UserProduct productOrderList(Connection conn, int productNo){
		UserProduct p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("orderList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);

			rset = pstmt.executeQuery();


			if(rset.next()) {
				p = new UserProduct(	rset.getInt("pro_no"),
						rset.getString("pro_name"),
						rset.getInt("price"),
						rset.getString("thumb_img")



						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;

	}
	public List<Product> selectProductList(Connection conn, int[] proNo) {
		List<Product> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		sql += "(";
		//동적으로 생성
		for(int i = 0; i < proNo.length; i++) {
			sql += proNo[i];
			if(i < proNo.length-1) {
				sql += ",";
			}
		}
		sql += ")";

		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, proNo[0]); //0번인덱스 고정으로 삽입

			rset = pstmt.executeQuery();
			//PRO_NO	PRO_NAME	PRICE	SOLDOUT	EXPIRED_DATE	ENROLL_DATE	SAVE	STATUS	THUMB_IMG	CATEGORY
			while(rset.next()) {
				Product product = new Product();
				product.setProNo(rset.getInt("PRO_NO"));
				product.setProName(rset.getString("PRO_NAME"));
				product.setPrice(rset.getInt("PRICE"));
				product.setThumbImg(rset.getString("THUMB_IMG"));


				list.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int insertOrder(Connection conn, Order order) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrder");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order.getUserNo());
			pstmt.setString(2, order.getDelAdd());
			pstmt.setString(3, order.getPhone());
			pstmt.setString(4, order.getEmail());
			pstmt.setString(5, order.getAddress());
			pstmt.setString(6, order.getRequire());


			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updatePoint(Connection conn, Member member, int point) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePoint");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setInt(2, member.getUser_No());


			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


}
