package com.odd.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.board.model.service.FAQService;
import com.odd.board.model.vo.FAQ;

/**
 * Servlet implementation class FAQInsertController
 */
@WebServlet("/insert.faq")
public class FAQInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String FAQCategory = request.getParameter("category");
		String FAQTitle = request.getParameter("title");
		String FAQContent = request.getParameter("content");
		
		HttpSession session = request.getSession();
		
		FAQ f = new FAQ();
		f.setCategory(FAQCategory);
		f.setContactTitle(FAQTitle);
		f.setContactAnswer(FAQContent);
		
		int result = new FAQService().insertFAQ(f);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "등록 성공");
			response.sendRedirect(request.getContextPath() + "/FAQlist.ad");
		}else {
			request.setAttribute("errorMsg", "등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
