package com.odd.recipe.model.dao;

import static com.odd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.odd.recipe.model.vo.Cooking;
import com.odd.common.model.vo.PageInfo;
import com.odd.recipe.model.vo.Recipe;

public class RecipeDao {
	private Properties prop = new Properties();
	
	public RecipeDao() {
		try {
			prop.loadFromXML(new FileInputStream(RecipeDao.class.getResource("/db/sql/recipe-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	public ArrayList<Recipe> selectList(Connection conn, PageInfo pi, int loginUser){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit()-1;
			pstmt.setInt(1, loginUser);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("recipe_no"),
								    rset.getString("recipe_title"),
								    rset.getString("thumbimg"),
								    rset.getInt("reply_count"),
								    rset.getInt("heart_count"),
								    rset.getInt("my_heart_status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Recipe> selectListSortByHeart(Connection conn, PageInfo pi, int loginUser){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListSortByHeart");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit()-1;
			pstmt.setInt(1, loginUser);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("recipe_no"),
								    rset.getString("recipe_title"),
								    rset.getString("thumbimg"),
								    rset.getInt("reply_count"),
								    rset.getInt("heart_count"),
								    rset.getInt("my_heart_status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Recipe> selectListSortByReply(Connection conn, PageInfo pi, int loginUser){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListSortByReply");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit()-1;
			pstmt.setInt(1, loginUser);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("recipe_no"),
								    rset.getString("recipe_title"),
								    rset.getString("thumbimg"),
								    rset.getInt("reply_count"),
								    rset.getInt("heart_count"),
								    rset.getInt("my_heart_status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertRecipe(Connection conn, Recipe r) {
		// insert
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRecipe");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRecipeTitle());
			pstmt.setString(2, r.getRecipeContent());
			pstmt.setString(3, r.getRecipeThumbImg());
			pstmt.setString(4, r.getEffect());
			pstmt.setString(5, r.getTime());
			pstmt.setString(6, r.getIngredient());
			pstmt.setInt(7, r.getProcessCount());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int insertCooking(Connection conn, ArrayList<Cooking> list) {
		// insert
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCooking");
		try {
			for(Cooking c : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, c.getCookingOrder());
				pstmt.setString(2, c.getCookingContent());
				pstmt.setString(3, c.getFilePath());
				// 실행
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int increaseCount(Connection conn, int recipeNo) {
		// update
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public Recipe selectRecipe(Connection conn, int recipeNo) {
		Recipe r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRecipe");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Recipe(rset.getInt("recipe_no"),
							   rset.getString("recipe_title"),
							   rset.getString("recipe_content"),
							   rset.getString("thumbimg"),
							   rset.getString("effect"),
							   rset.getString("time"),
							   rset.getString("ingredient"),
							   rset.getInt("process_count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	public ArrayList<Cooking> selectCooking(Connection conn, int recipeNo) {
		ArrayList<Cooking> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCooking");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Cooking c = new Cooking();
				c.setCookingOrder(rset.getInt("cooking_order"));
				c.setCookingContent(rset.getString("cooking_content"));
				c.setFilePath(rset.getString("file_path"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertHeart(Connection conn, int userNo, int recipeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertHeart");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			pstmt.setInt(2, userNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteHeart(Connection conn, int userNo, int recipeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteHeart");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, recipeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectHeartCount(Connection conn, int recipeNo, int userNo) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHeartCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	/**
	 * 레시피 검색창 결과 수
	 * @param conn
	 * @param effectArr (배열)
	 * @param timeArr (배열)
	 * @param ingredient
	 * @return
	 */
	public int selectSearchListCount(Connection conn, String[] effectArr, String[] timeArr, String ingredient) {
		// select
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchListCount");
		if(timeArr != null) {
			// sql에 and time in ( 연이으고 String.join이용해서 ,로 연이은 문자열을 연이어요 + )
			sql += "AND TIME IN (";
			sql += String.join(",", timeArr);
			sql += ")";
		}
		if(effectArr != null) {
			// sql에 and ( 연이으고 
			// 반복문 돌려가면서 저모양 만들어주세요
			sql += " AND (";
			for(int i=0; i<effectArr.length; i++) {
				if(i < effectArr.length-1) {
					sql += "EFFECT LIKE '%'||" + effectArr[i] + "||'%' OR ";
				} else {
					sql += "EFFECT LIKE '%'||" + effectArr[i] + "||'%')";
				}
			}
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ingredient);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public ArrayList<Recipe> searchRecipe(Connection conn, PageInfo pi, int loginUser, String[] effectArr, String[] timeArr, String ingredient, String sort){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchRecipe");
		
		if(timeArr != null) {
			sql += "AND TIME IN (";
			sql += String.join(",", timeArr);
			sql += ")";
		}
		if(effectArr != null) {
			sql += " AND (";
			for(int i=0; i<effectArr.length; i++) {
				if(i < effectArr.length-1) {
					sql += "EFFECT LIKE '%'||" + effectArr[i] + "||'%' OR ";
				} else {
					sql += "EFFECT LIKE '%'||" + effectArr[i] + "||'%')";
				}
			}
		}
		// 정렬기준
		if(sort == null || sort.equals("new")) {
			sql += " ORDER BY RECIPE_NO DESC )A)";			
		} else if(sort.equals("heart")) {
			sql += " ORDER BY HEART_COUNT DESC, RECIPE_NO DESC )A)";
		} else {
			sql += " ORDER BY REPLY_COUNT DESC, RECIPE_NO DESC )A)";
		}
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit()-1;
		sql += "WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser);
			pstmt.setString(2, ingredient);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("recipe_no"),
								    rset.getString("recipe_title"),
								    rset.getString("thumbimg"),
								    rset.getInt("reply_count"),
								    rset.getInt("heart_count"),
								    rset.getInt("my_heart_status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
}
