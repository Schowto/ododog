package com.odd.board.model.dao;

import static com.odd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.odd.board.model.vo.Consult;
import com.odd.common.model.vo.PageInfo;

public class ConsultDao {
	
	private Properties prop = new Properties();
	
	public ConsultDao() {
		try {
			prop.loadFromXML(new FileInputStream(ConsultDao.class.getResource("/db/sql/consult-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 1:1상담게시물 갯수 
	 * @param conn
	 * @param userId
	 */
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
	}
	
	public ArrayList<Consult> selectList(Connection conn, PageInfo pi) {

		ArrayList<Consult> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("slectList");
	}
	
	public ArrayList<Consult> selectCounsult(Connection conn, String userId){
		
		ArrayList<Consult> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectConsult");
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
