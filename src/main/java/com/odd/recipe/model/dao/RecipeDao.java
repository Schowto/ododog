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

import com.odd.board.model.vo.Cooking;
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
	
	public ArrayList<Recipe> selectList(Connection conn, PageInfo pi){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit()-1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("recipe_no"),
								    rset.getString("recipe_title"),
								    rset.getString("thumbimg"),
								    rset.getInt("reply_count")));
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
	
}
