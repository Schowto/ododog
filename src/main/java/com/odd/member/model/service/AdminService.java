package com.odd.member.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;

import com.odd.member.model.dao.AdminDao;
import com.odd.member.model.vo.Admin;

public class AdminService {
	
	public Admin loginAdmin(String adminId, String password) {
		Connection conn = getConnection();
		Admin a = new AdminDao().loginAdmin(conn, adminId, password);
		close(conn);
		return a;
		
	}

}
