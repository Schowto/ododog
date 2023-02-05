package com.odd.member.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;

import com.odd.member.model.dao.ReviewDao;
import com.odd.member.model.vo.Review;

public class ReviewService {
	
	public int insertReview(Review r) {
		Connection conn = getConnection();
		int result = new ReviewDao().insertReview(conn, r);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int updateReview(Review r) {
		Connection conn = getConnection();
		int result = new ReviewDao().updateReview(conn, r);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int deleteReview(int reviewNo) {
		Connection conn = getConnection();
		int result = new ReviewDao().deleteReview(conn, reviewNo);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public Review selectReview(int proNo) {
		Connection conn = getConnection();
		Review r = new ReviewService().selectReview(proNo);
		close(conn);
		return r;
	}
	
	

}
