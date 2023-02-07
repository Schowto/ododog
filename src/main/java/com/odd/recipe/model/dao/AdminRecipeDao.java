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

import com.odd.board.model.vo.Reply;
import com.odd.common.model.vo.PageInfo;
import com.odd.recipe.model.vo.Cooking;
import com.odd.recipe.model.vo.Recipe;


public class AdminRecipeDao {

	private Properties prop = new Properties();

	public AdminRecipeDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdminRecipeDao.class.getResource("/db/sql/adminRecipe-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		// select
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {
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
	public int selectReplyListCount(Connection conn) {
		// select
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {
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
		// select
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
								   rset.getInt("count"),
								   rset.getString("create_date"),
								   rset.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Reply> selectReplyList(Connection conn, PageInfo pi){
		// select
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit()-1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Reply(rset.getInt("reply_no"),
								   rset.getInt("board_no"),
								   rset.getString("user_id"),
								   rset.getString("reply_content"),
								   rset.getString("create_date"),
								   rset.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int updateStatus(Connection conn, int recipeNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateStatus");
		try {
			pstmt = conn.prepareStatement(sql);
			if(status.equals("Y")) {
				pstmt.setString(1, "N");
			} else {
				pstmt.setString(1, "Y");
			}
			pstmt.setInt(2, recipeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int updateStatusR(Connection conn, int replyNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateStatusR");
		try {
			pstmt = conn.prepareStatement(sql);
			if(status.equals("Y")) {
				pstmt.setString(1, "N");
			} else {
				pstmt.setString(1, "Y");
			}
			pstmt.setInt(2, replyNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteRecipe(Connection conn, int recipeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteRecipe");
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
	public int deleteReply(Connection conn, int replyNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReply");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
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
				c.setCookingNo(rset.getInt("cooking_no"));
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
	
	public int updateRecipe(Connection conn, Recipe r) {
		// update
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRecipe");
		if(r.getRecipeThumbImg() != null) {
			sql += ", THUMBIMG = " + r.getRecipeThumbImg();
		}
		sql += " WHERE RECIPE_NO = " + r.getRecipeNo();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRecipeTitle());
			pstmt.setString(2, r.getRecipeContent());
			pstmt.setString(3, r.getEffect());
			pstmt.setString(4, r.getTime());
			pstmt.setString(5, r.getIngredient());
			pstmt.setInt(6, r.getProcessCount());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int updateCooking(Connection conn, ArrayList<Cooking> list) {
		// update
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCooking");
		try {
			for(Cooking c : list) {
				if(c.getFilePath() != null) {
					sql += ", FILE_PATH = " + c.getFilePath();
				}
				sql += " WHERE COOKING_NO = " + c.getCookingNo();
				System.out.println(sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, c.getCookingContent());
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
