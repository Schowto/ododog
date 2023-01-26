package com.odd.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.dao.FAQDao;
import com.odd.board.model.vo.FAQ;
import static com.odd.common.JDBCTemplate.*;

public class FAQService {

	public ArrayList<FAQ> selectFAQList(){
		Connection conn = getConnection();
		System.out.println("서비스확인");
		ArrayList<FAQ> list = new FAQDao().selectFAQList(conn);
		close(conn);
		return list;
	}
}
