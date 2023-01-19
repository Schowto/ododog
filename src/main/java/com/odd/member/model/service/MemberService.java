package com.odd.member.model.service;

import java.sql.Connection;

import com.odd.common.JDBCTemplate;
import com.odd.member.model.dao.MemberDao;

public class MemberService {
	
	public void loginMember(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		new MemberDao.loginMember(conn, userId, userPwd);
		
	}

}
