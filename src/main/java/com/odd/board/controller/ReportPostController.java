package com.odd.board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.board.model.service.BoardService;
import com.odd.board.model.vo.Board;
import com.odd.member.model.vo.Member;

/**
 * Servlet implementation class ReportPostController
 */
@WebServlet("/postreport.me")
public class ReportPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUser_No();
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		String reportContent = request.getParameter("reportContent");
		
		Board r = new Board();
		r.setUserNo(userNo);
		r.setPostNo(postNo);
		r.setReportContent(reportContent);
		
		
		
		
		
		int result = new BoardService().postReport(r);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글 신고가 접수되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
		} else {
			session.setAttribute("alertMsg", "신고접수실패 다시 시도해주세요.");
			response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
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
