package com.odd.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.board.model.service.FAQService;
import com.odd.board.model.vo.FAQ;

/**
 * Servlet implementation class FAQUpdateController_2
 */
@WebServlet("/update.faq")
public class FAQUpdateController_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQUpdateController_2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int contactNo = Integer.parseInt(request.getParameter("no"));
		String FAQCategory = request.getParameter("category");
		String FAQTitle = request.getParameter("title");
		String FAQContent = request.getParameter("content");
		
		FAQ f = new FAQ();
		f.setContactNo(contactNo);
		f.setCategory(FAQCategory);
		f.setContactTitle(FAQTitle);
		f.setContactAnswer(FAQContent);
		
		int result = new FAQService().updateFAQ(f);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글이 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/FAQlist.ad");
		}else {
			
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
