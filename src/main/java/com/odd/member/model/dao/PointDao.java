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

import com.odd.member.model.vo.Point;

public class PointDao {
	
	private Properties prop = new Properties();
	
	public PointDao() {
		String filePath = PointDao.class.getResource("/db/sql/point-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Point> selectAllPoint(Connection conn, int userNo) {
		ArrayList<Point> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add ( new Point(rset.getInt("point_no"),
						      rset.getString("point_category"),
						      rset.getDate("point_date"),
						      rset.getString("point_use"),
						      rset.getInt("point_price")));
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
