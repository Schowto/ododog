package com.odd.recipe.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.vo.Reply;
import com.odd.common.model.vo.PageInfo;
import com.odd.recipe.model.dao.AdminRecipeDao;
import com.odd.recipe.model.vo.Recipe;


public class AdminRecipeService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int count = new AdminRecipeDao().selectListCount(conn);
		close(conn);
		return count;
	}
	public int selectReplyListCount() {
		Connection conn = getConnection();
		int count = new AdminRecipeDao().selectReplyListCount(conn);
		close(conn);
		return count;
	}
	public ArrayList<Recipe> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new AdminRecipeDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	public ArrayList<Reply> selectReplyList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Reply> list = new AdminRecipeDao().selectReplyList(conn, pi);
		close(conn);
		return list;
	}

}
