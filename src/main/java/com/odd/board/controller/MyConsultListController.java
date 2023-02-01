package com.odd.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.board.model.service.ConsultService;
import com.odd.board.model.vo.Consult;
import com.odd.common.model.vo.PageInfo;
import com.odd.member.model.vo.Member;

/**
 * Servlet implementation class ConsultBoardListController
 */
@WebServlet("/list.co")
public class MyConsultListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyConsultListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") == null) {
			
			session.setAttribute("alertMsg", "로그인후에 다시 이용해주세요.");
			response.sendRedirect(request.getContextPath());
			
			
		}else {
			
			//String userId = (String)session.getAttribute("loginUser.getUser_Id()");
			// String userId = ((String)session.getAttribute("loginUser")).getUser_Id();
			
			/*
			// 페이징처리
			int listCount;
			int currentPage;
			int pageLimit;
			int boardLimit;
			
			int maxPage;
			int startPage;
			int endPage;
			
			listCount = new ConsultService().selectListCount();
			
			currentPage = Integer.parseInt(request.getParameter("cpage"));
			
			pageLimit = 10;
			boardLimit = 10;
			
			maxPage = (int)Math.ceil((double)listCount / boardLimit);
			
			startPage = (currentPage-1) / pageLimit * pageLimit + 1;
			
			endPage = startPage + pageLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(listCount, currentPage, pageLimit,
					                   boardLimit, maxPage, startPage, endPage);
			
			//응답페이지
			
			ArrayList<Consult> list = new ConsultService().selectList(pi, userId);
					
			request.setAttribute("pi", pi);
			*/
			
			int userNo = ((Member)session.getAttribute("loginUser")).getUser_No();
			
			ArrayList<Consult> list = new ConsultService().selectConsult(userNo);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/board/myConsultListView.jsp").forward(request,response);
			
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
