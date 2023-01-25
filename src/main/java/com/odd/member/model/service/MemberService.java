package com.odd.member.model.service;

import java.sql.Connection;

import static com.odd.common.JDBCTemplate.*;
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


}
