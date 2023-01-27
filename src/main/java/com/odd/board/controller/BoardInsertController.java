package com.odd.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.board.model.service.BoardService;
import com.odd.board.model.vo.Board;

/**
 * Servlet implementation class BoardEnrollController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String boardTitle = request.getParameter("title");
		int userNo = 0;	//넣기!!!!!
		String boardContent = request.getParameter("content");
		
		Board b = new Board();
		b.setBoardTitle(boardTitle);
		b.setBoardWriter(String.valueOf(userNo));
		b.setBoardContent(boardContent);
		
		int result = new BoardService().insertBoard(b);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
			response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
		} else {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
