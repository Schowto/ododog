package com.odd.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.board.model.service.AdminBoardService;
import com.odd.board.model.vo.Board;
import com.odd.board.model.vo.Reply;
import com.odd.common.model.vo.PageInfo;

/**
 * Servlet implementation class adminBoardSearchController
 */
@WebServlet("/search.adBo")
public class AdminBoardSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardSort = request.getParameter("bSort");
		String boardKeyword = request.getParameter("bKeyword");
		String replySort = request.getParameter("rSort");
		String replyKeyword = request.getParameter("rKeyword");
		
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

		listCount = new AdminBoardService().selectSearchListCount(boardSort, boardKeyword);
		replyListCount = new AdminBoardService().selectSearchReplyListCount(replySort, replyKeyword);
		boardPage = Integer.parseInt(request.getParameter("bpage"));
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
		// 여기부터 하장 setAttribute로 검색기준,값들 다 넘겨서 페이지 url 처리까지,,!
		ArrayList<Board> list = new AdminBoardService().searchList(pi, boardSort, boardKeyword);
		ArrayList<Reply> replyList = new AdminBoardService().searchReplyList(replyPi, replySort, replyKeyword);
		
		request.setAttribute("bSort", boardSort);
		request.setAttribute("rSort", replySort);
		request.setAttribute("bKeyword", boardKeyword);
		request.setAttribute("rKeyword", replyKeyword);
		
		request.setAttribute("pi", pi);
		request.setAttribute("replyPi", replyPi);
		request.setAttribute("list", list);
		request.setAttribute("replyList", replyList);
		request.getRequestDispatcher("views/board/adminBoardListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
