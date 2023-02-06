package com.odd.member.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.member.model.dao.PointDao;
import com.odd.member.model.vo.Point;

public class PointService {
	
	public ArrayList<Point> selectAllPoint(int userNo) {
		Connection conn = getConnection();
		ArrayList<Point> list = new PointDao().selectAllPoint(conn, userNo);
		close(conn);
		return list;
	}

}
