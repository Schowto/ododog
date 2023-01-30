package com.odd.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.odd.common.JDBCTemplate.*;

import com.odd.board.model.dao.FAQDao;
import com.odd.board.model.vo.FAQ;
import com.odd.member.model.dao.MemberDao;
import com.odd.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
		
	}
	
	/**
	 * 회원가입요청 서비스 (소민)
	 * @param m
	 * @return
	 */
	public int insertMember(Member m) {
		 Connection conn = getConnection();
		 int result = new MemberDao().insertMember(conn, m);
		 
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
	}
	
	public ArrayList<Member> selectMemberList(){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectMemberList(conn);
		close(conn);
		return list;
	}
	
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		
		ArrayList<Member> updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMemberList(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return m;
		
	}
	
	public ArrayList<Member> updatePwdMember(String userId, String userPwd, String updatePwd) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwdMember(conn, userId, userPwd, updatePwd);
		
		ArrayList<Member> updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMemberList(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return updateMem;		
		
	}


}
