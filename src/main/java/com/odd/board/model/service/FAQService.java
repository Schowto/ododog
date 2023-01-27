package com.odd.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.dao.FAQDao;
import com.odd.board.model.vo.FAQ;
import static com.odd.common.JDBCTemplate.*;

public class FAQService {

	public ArrayList<FAQ> selectFAQList(){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectFAQList(conn);
		close(conn);
		return list;
	}
	
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
	
	public FAQ selectFAQ(int contactNo) {
		Connection conn = getConnection();
		FAQ f = new FAQDao().selectFAQ(conn, contactNo);
		close(conn);
		return f;
	}
	
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
}
