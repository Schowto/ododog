package com.odd.order.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.order.model.dao.LikeDao;
import com.odd.order.model.vo.Like;

public class LikeService {
	
	public ArrayList<Like> selectLike(int userNo) {
		Connection conn = getConnection();
		ArrayList<Like> list = new LikeDao().selectLike(conn, userNo);
		close(conn);
		return list;
		
	}

}
