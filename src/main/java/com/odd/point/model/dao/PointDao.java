package com.odd.point.model.dao;

import static com.odd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.odd.point.model.vo.Point;

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
	
	public Point selectpoint(Connection conn, String userNo) {
		
		Point p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectpoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Point(rset.getInt("userNo"),
							  rset.getDate("pointDate"),
							  rset.getString("pointUse"),
							  rset.getInt("pointPrice"));
						}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
	}
	

}
