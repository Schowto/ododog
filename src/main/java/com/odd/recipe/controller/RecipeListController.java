package com.odd.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.common.model.vo.PageInfo;
import com.odd.recipe.model.service.RecipeService;
import com.odd.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeListController
 */
@WebServlet("/list.re")
public class RecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; 		// 현재 게시글 개수
		int currentPage; 	// 사용자가 요청한 페이지 ( == 현재페이지)
		int pageLimit; 		// 페이지 하단에 보여질 페이징바의 페이지 최대개수 (몇개 단위씩)
		int boardLimit; 	// 페이지당 보여질 게시글의 최대개수 (몇개 단위씩)

		int maxPage; 		// 가장 마지막 페이지 (총 페이지 수)
		int startPage; 		// 사용자가 요청한 페이지 하단 페이징바의 시작수
		int endPage; 		// 사용자가 요청한 페이지 하단 페이징바의 끝수

		listCount = new RecipeService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 6;

		maxPage = (int) Math.ceil((double) listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		String sort = request.getParameter("sort");
		
		ArrayList<Recipe> list = null;
		if(sort == null || sort.equals("new")) {
			// 최신순
			list = new RecipeService().selectList(pi);
		} else if(sort.equals("heart")) {
			// 하트순
			list = new RecipeService().selectListSortByHeart(pi);
		} else {
			// 댓글순
			list = new RecipeService().selectListSortByReply(pi);
		}
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("sort", sort);
		request.getRequestDispatcher("views/recipe/recipeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
