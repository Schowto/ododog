package com.odd.board.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.vo.Consult;
import com.odd.common.model.vo.PageInfo;

public class ConsultService {
	
	/**
	 * 페이징처리
	 * @param pi
	 * @return
	 */
	public ArrayList<Consult> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Consult> list = new ConsultService().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 맞춤상담 총 갯수
	 * @param userId
	 * @return
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int result = new ConsultService().selectListCount();
		close(conn);
		return result;
		
	}
	
	/**
	 * 맞춤상담 조회
	 * @param userId
	 * @return
	 */
	public ArrayList<Consult> selectConsult(String userId){
		Connection conn = getConnection();
		ArrayList<Consult> list = new ConsultService().selectConsult(userId);
		close(conn);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
