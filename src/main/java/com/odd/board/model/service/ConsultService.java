package com.odd.board.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.dao.ConsultDao;
import com.odd.board.model.vo.Consult;
import com.odd.common.model.vo.PageInfo;

public class ConsultService {
	
	/**
	 * 페이징처리
	 * @param pi
	 * @return
	 */
	public ArrayList<Consult> selectList(PageInfo pi, int userNo){
		Connection conn = getConnection();
		ArrayList<Consult> list = new ConsultDao().selectList(conn, pi, userNo);
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
		int listCount = new ConsultDao().selectListCount(conn);
		close(conn);
		return listCount;
		
	}
	
	/**
	 * 맞춤상담 총조회
	 * @param userId
	 * @return
	 */
	public ArrayList<Consult> selectAllConsult(int userNo){
		Connection conn = getConnection();
		ArrayList<Consult> list = new ConsultDao().selectAllConsult(conn,userNo);
		close(conn);
		return list;
	}
	
	
	public int insertConsult(int userNo, Consult c) {
		Connection conn = getConnection();
		int result = new ConsultDao().insertConsult(conn,userNo, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Consult selectConsult(int consultNo) {
		Connection conn = getConnection();
		Consult c = new ConsultDao().selectConsult(conn, consultNo);
		
		close(conn);
		return c;
	}
	
	
	public int updateConsult(int consultNo, Consult c) {
		
		Connection conn = getConnection();
		int result = new ConsultDao().updateConsult(conn, consultNo, c);
		
		close(conn);
		return result;
		
		
	}
	
	public int deleteConsult(int consultNo) {
		Connection conn = getConnection();
		int result = new ConsultDao().deleteConsult(conn, consultNo);
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
