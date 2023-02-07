package com.odd.recipe.model.service;

import static com.odd.common.JDBCTemplate.close;
import static com.odd.common.JDBCTemplate.commit;
import static com.odd.common.JDBCTemplate.getConnection;
import static com.odd.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.vo.Reply;
import com.odd.common.model.vo.PageInfo;
import com.odd.recipe.model.dao.AdminRecipeDao;
import com.odd.recipe.model.vo.Cooking;
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
	
	public int updateStatus(int recipeNo, String status) {
		Connection conn = getConnection();
		int result = new AdminRecipeDao().updateStatus(conn, recipeNo, status);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int updateStatusR(int replyNo, String status) {
		Connection conn = getConnection();
		int result = new AdminRecipeDao().updateStatusR(conn, replyNo, status);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deleteRecipe(int recipeNo) {
		Connection conn = getConnection();
		int result = new AdminRecipeDao().deleteRecipe(conn, recipeNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deleteReply(int replyNo) {
		Connection conn = getConnection();
		int result = new AdminRecipeDao().deleteReply(conn, replyNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Recipe selectRecipe(int recipeNo) {
		Connection conn = getConnection();
		Recipe r = new AdminRecipeDao().selectRecipe(conn, recipeNo);
		close(conn);
		return r;
	}
	public ArrayList<Cooking> selectCooking(int recipeNo){
		Connection conn = getConnection();
		ArrayList<Cooking> list = new AdminRecipeDao().selectCooking(conn, recipeNo);
		close(conn);
		return list;
	}
	
	public int updateRecipe(Recipe r, ArrayList<Cooking> list) {
		Connection conn = getConnection();
		int result1 = new AdminRecipeDao().updateRecipe(conn, r);
		int result2 = new AdminRecipeDao().updateCooking(conn, list);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
}
