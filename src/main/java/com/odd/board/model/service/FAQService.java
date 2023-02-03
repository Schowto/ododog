package com.odd.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.dao.FAQDao;
import com.odd.board.model.vo.FAQ;
import static com.odd.common.JDBCTemplate.*;

public class FAQService {

	/**
	 * FAQ 전체리스트 조회
	 * @return
	 */
	public ArrayList<FAQ> selectFAQList(){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectFAQList(conn);
		close(conn);
		return list;
	}
	
	/**
	 * FAQ 작성하기
	 * @param f
	 * @return
	 */
	public int insertFAQ(FAQ f) {
		Connection conn = getConnection();
		int result = new FAQDao().insertFAQ(conn, f);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 
	 * @param contactNo
	 * @return
	 */
	public FAQ selectFAQ(int contactNo) {
		Connection conn = getConnection();
		FAQ f = new FAQDao().selectFAQ(conn, contactNo);
		close(conn);
		return f;
	}
	
	/**
	 * FAQ 수정하기
	 * @param f
	 * @return
	 */
	public int updateFAQ(FAQ f) {
		Connection conn = getConnection();
		int result = new FAQDao().updateFAQ(conn, f);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * FAQ 삭제하기
	 * @param contactNo
	 * @return
	 */
	public int deleteFAQ(int contactNo) {
		Connection conn = getConnection();
		int result = new FAQDao().deleteFAQ(conn, contactNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * FAQ 키워드 검색
	 * @param keyword
	 * @return
	 */
	public ArrayList<FAQ> searchFAQ(String keyword){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().searchFAQ(conn, keyword);
		close(conn);
		return list;
	}
}
