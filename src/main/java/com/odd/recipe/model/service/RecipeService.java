package com.odd.recipe.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.board.model.vo.Cooking;
import com.odd.common.model.vo.PageInfo;
import com.odd.recipe.model.dao.RecipeDao;
import com.odd.recipe.model.vo.Recipe;


public class RecipeService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int count = new RecipeDao().selectListCount(conn);
		close(conn);
		return count;
	}
	
	public ArrayList<Recipe> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 레시피 등록
	 * @param r 레시피
	 * @param list 한 레시피 글 안에 있는 여러 요리과정에 대한 정보
	 * @return
	 */
	public int insertRecipe(Recipe r, ArrayList<Cooking> list) {
		Connection conn = getConnection();
		int result1 = new RecipeDao().insertRecipe(conn, r);
		int result2 = new RecipeDao().insertCooking(conn, list);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

}
