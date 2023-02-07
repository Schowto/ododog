package com.odd.order.model.dao;

import static com.odd.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.odd.order.model.vo.Like;
import com.odd.product.model.vo.Product;

import com.odd.product.model.dao.UserProductDao;

public class LikeDao {
	
	private Properties prop = new Properties();

	public LikeDao() {

		try {
			prop.loadFromXML(new FileInputStream(UserProductDao.class.getResource("/db/sql/userOrder-mapper.xml").getPath()));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Like> selectLike(Connection conn, int userNo){
		ArrayList<Like> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Like(rset.getInt("pro_no"),
								  rset.getInt("user_no"),
								  rset.getDate("like_date"),
								  rset.getString("pro_name"),
								  rset.getInt("price"),
								  rset.getString("thumbImg")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
