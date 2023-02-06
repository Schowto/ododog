package com.odd.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.board.model.service.AdminBoardService;
import com.odd.board.model.vo.Board;
import com.odd.member.model.vo.Admin;

/**
 * Servlet implementation class AdminNoticeInsertController
 */
@WebServlet("/insert.adNo")
public class AdminNoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String boardTitle = request.getParameter("title");
		HttpSession session = request.getSession();
		int boardWriter = ((Admin)session.getAttribute("loginAdmin")).getAdmin_No();
		String boardContent = request.getParameter("content");
		
		Board b = new Board();
		b.setBoardTitle(boardTitle);
		b.setBoardWriter(String.valueOf(boardWriter));
		b.setBoardContent(boardContent);
		
		int result = new AdminBoardService().insertNotice(b);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 작성되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.adNo?cpage=1");
		} else {
			session.setAttribute("alertMsg", "공지사항 작성 실패");
			response.sendRedirect(request.getContextPath() + "/list.adNo?cpage=1");
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
