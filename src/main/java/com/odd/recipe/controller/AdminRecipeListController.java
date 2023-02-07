package com.odd.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.board.model.vo.Reply;
import com.odd.common.model.vo.PageInfo;
import com.odd.recipe.model.service.AdminRecipeService;
import com.odd.recipe.model.vo.Recipe;

/**
 * Servlet implementation class AdminRecipeListController
 */
@WebServlet("/list.adRe")
public class AdminRecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRecipeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ----------------- 페이징 처리 ------------------
		int listCount; 		// 현재 게시글 개수
		int boardPage; 		// 사용자가 요청한 일반 게시글 페이지 ( == 현재페이지)
		int replyListCount;
		int replyPage;

		int pageLimit; 		// 페이지 하단에 보여질 페이징바의 페이지 최대개수 (몇개 단위씩)
		int boardLimit; 	// 페이지당 보여질 게시글의 최대개수 (몇개 단위씩)
		
		int maxPage; 		// 가장 마지막 페이지 (총 페이지 수)
		int startPage; 		// 사용자가 요청한 페이지 하단 페이징바의 시작수
		int endPage; 		// 사용자가 요청한 페이지 하단 페이징바의 끝수
		int replyMaxPage;
		int replyStartPage;
		int replyEndPage;

		listCount = new AdminRecipeService().selectListCount();
		replyListCount = new AdminRecipeService().selectReplyListCount();
		boardPage = Integer.parseInt(request.getParameter("cpage"));
		replyPage = Integer.parseInt(request.getParameter("rpage"));
		
		pageLimit = 5;
		boardLimit = 10;
		
		maxPage = (int) Math.ceil((double) listCount / boardLimit);
		replyMaxPage = (int) Math.ceil((double) replyListCount / boardLimit);
		startPage = (boardPage - 1) / pageLimit * pageLimit + 1;
		replyStartPage = (replyPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		replyEndPage = replyStartPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		if(replyEndPage > replyMaxPage) {
			replyEndPage = replyMaxPage;
		}
		PageInfo pi = new PageInfo(listCount, boardPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		PageInfo replyPi = new PageInfo(replyListCount, replyPage, pageLimit, boardLimit, replyMaxPage, replyStartPage, replyEndPage);
		
		String sort = request.getParameter("sort");
		ArrayList<Recipe> list = new AdminRecipeService().selectList(pi, sort);
		ArrayList<Reply> replyList = new AdminRecipeService().selectReplyList(replyPi);
		request.setAttribute("pi", pi);
		request.setAttribute("replyPi", replyPi);
		request.setAttribute("list", list);
		request.setAttribute("replyList", replyList);
		request.setAttribute("sort", sort);
		request.getRequestDispatcher("views/recipe/adminRecipeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
