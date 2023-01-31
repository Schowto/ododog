package com.odd.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.board.model.service.BoardService;
import com.odd.board.model.vo.Reply;
import com.odd.member.model.vo.Member;

/**
 * Servlet implementation class AjaxReplyInsertController
 */
@WebServlet("/rinsert.bo")
public class AjaxReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyContent = request.getParameter("content");
		int boardType = Integer.parseInt(request.getParameter("boardType"));
		int boardNo = Integer.parseInt(request.getParameter("no"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUser_No();
		
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setBoardType(boardType);
		r.setBoardNo(boardNo);
		r.setReplyWriter(String.valueOf(userNo));
		
		int result = new BoardService().insertReply(r);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
