package com.odd.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.board.model.service.FAQService;
import com.odd.board.model.vo.FAQ;

/**
 * Servlet implementation class FAQSerchController
 */
@WebServlet("/searchU.faq")
public class FAQSearchUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQSearchUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//ArrayList<FAQ> list = new FAQService().selectFAQList();
		
		String keyword = request.getParameter("keyword");
		
		ArrayList<FAQ> list = new FAQService().searchFAQ(keyword);
		
		
		
		
		request.setAttribute("keyword", keyword);
		//request.setAttribute("slist", slist);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/board/FAQuser.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
