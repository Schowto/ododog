package com.odd.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.board.model.service.BoardService;
import com.odd.board.model.vo.Board;
import com.odd.common.model.vo.PageInfo;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/list.bo")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 페이징 처리 */
		// 전체 게시글 수
		int listCount = new BoardService().selectListCount();
		// 사용자가 요청한 페이지 == 현재 페이지
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		// 페이지 하단에 보여질 페이징바의 개수 (몇개 단위)
		int pageLimit = 10;
		
		// 공지사항 개수
		int noticeCount = new BoardService().selectNoticeCount();
		// 노출할 일반게시글 개수 : 15개 - 공지사항 개수
		int boardLimit = 15 - noticeCount;

		// 전체 페이지 수
		int maxPage = (int) Math.ceil((double) listCount / boardLimit);
		// 현재 페이지 하단 페이징바의 시작수
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		// 현재 페이지 하단 페이징바의 끝수
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<Board> nList = new BoardService().selectNoticeList();	// 공지사항 리스트
		ArrayList<Board> list = new BoardService().selectList(pi);		// 일반게시글 리스트

		request.setAttribute("pi", pi);
		request.setAttribute("nList", nList);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/board/boardListView.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
