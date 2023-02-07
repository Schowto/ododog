package com.odd.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.board.model.service.AdminBoardService;
import com.odd.board.model.service.BoardService;
import com.odd.board.model.vo.Board;

/**
 * Servlet implementation class AdminNoticeUpdateController
 */
@WebServlet("/updateForm.adNo")
public class AdminNoticeUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("no"));
		Board b = new AdminBoardService().selectBoard(boardNo);
		request.setAttribute("b", b);
		request.getRequestDispatcher("/views/board/adminNoticeUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
