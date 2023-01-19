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

}
