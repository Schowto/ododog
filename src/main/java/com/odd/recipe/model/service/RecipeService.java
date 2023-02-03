package com.odd.recipe.model.service;

import static com.odd.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.odd.recipe.model.vo.Cooking;
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
	public ArrayList<Recipe> selectListSortByHeart(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectListSortByHeart(conn, pi);
		close(conn);
		return list;
	}
	public ArrayList<Recipe> selectListSortByReply(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectListSortByReply(conn, pi);
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
	
	/**
	 * 레시피 게시판 글 상세조회 위함
	 * 조회수 증가 후 조회
	 */
	public int increaseCount(int recipeNo) {
		Connection conn = getConnection();
		int result = new RecipeDao().increaseCount(conn, recipeNo);
		close(conn);
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
		Recipe r = new RecipeDao().selectRecipe(conn, recipeNo);
		close(conn);
		return r;
	}
	public ArrayList<Cooking> selectCooking(int recipeNo){
		Connection conn = getConnection();
		ArrayList<Cooking> list = new RecipeDao().selectCooking(conn, recipeNo);
		close(conn);
		return list;
	}
	
	public int insertHeart(int userNo, int recipeNo) {
		Connection conn = getConnection();
		int result = new RecipeDao().insertHeart(conn, userNo, recipeNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deleteHeart(int userNo, int recipeNo) {
		Connection conn = getConnection();
		int result = new RecipeDao().deleteHeart(conn, userNo, recipeNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @param recipeNo
	 * @param userNo
	 * @return HEART 테이블에 등록되어있는지 : 있으면 1, 없으면 0
	 */
	public int selectHeartCount(int recipeNo, int userNo) {
		Connection conn = getConnection();
		int count = new RecipeDao().selectHeartCount(conn, recipeNo, userNo);
		close(conn);
		return count;
	}

	/**
	 * 효과, 재료로 검색
	 * @param effectArr
	 * @param ingredient
	 * @return
	 */
	public int selectSearchListCount(String[] effectArr, String[] timeArr, String ingredient) {
		Connection conn = getConnection();
		int count = new RecipeDao().selectSearchListCount(conn, effectArr, timeArr, ingredient);
		close(conn);
		return count;
	}
	public ArrayList<Recipe> searchRecipe(PageInfo pi, String[] effectArr, String[] timeArr, String ingredient){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().searchRecipe(conn, pi, effectArr, timeArr, ingredient);
		close(conn);
		return list;
	}
}
