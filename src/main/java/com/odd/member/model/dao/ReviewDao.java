package com.odd.member.model.dao;

import static com.odd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.odd.member.model.vo.Review;
import com.odd.product.model.vo.Product;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		String filePath = ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertReview(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getProNo());
			pstmt.setInt(2, r.getUserNo());
			pstmt.setString(3, r.getReviewTitle());
			pstmt.setString(4, r.getReviewContent());
			pstmt.setDouble(5, r.getStar());
			pstmt.setString(6, r.getReviewPhoto());
			pstmt.setString(7, r.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateReview(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReviewTitle());
			pstmt.setString(2, r.getReviewContent());
			pstmt.setDouble(3, r.getStar());
			pstmt.setString(4, r.getReviewPhoto());
			pstmt.setString(5, r.getFilePath());
			pstmt.setInt(6, r.getReviewNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteReview(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Review> selectAllReview(Connection conn, int proNo) {
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				list.add(new Review(rset.getInt("review_no"),
							   rset.getString("pro_name"),
							   rset.getString("user_id"),
							   rset.getString("review_title"),
							   rset.getString("review_content"),
							   rset.getDouble("star"),
							   rset.getDate("modify_date"),
							   rset.getDate("enroll_date"),
							   rset.getString("review_photo"),
							   rset.getString("file_path")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}

	public Review reviewStar(Connection conn, int proNo) {
		Review r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reviewStar");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review(rset.getInt("review_no"),
						   rset.getString("pro_name"),
						   rset.getString("user_id"),
						   rset.getString("review_title"),
						   rset.getString("review_content"),
						   rset.getDouble("star"),
						   rset.getDate("modify_date"),
						   rset.getDate("enroll_date"),
						   rset.getString("review_photo"),
						   rset.getString("file_path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
		
	}
	
	public Product reviewProduct(Connection conn, int proNo) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reviewProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(
						        rset.getInt("pro_no"),
								rset.getString("category"),
						        rset.getString("pro_name"),
						        rset.getInt("price"),
						        rset.getString("thumb_img"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

}
