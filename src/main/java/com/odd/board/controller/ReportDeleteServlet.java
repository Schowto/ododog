package com.odd.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.board.model.service.BoardService;
import com.odd.board.model.service.FAQService;

/**
 * Servlet implementation class ReportDeleteServlet
 */
@WebServlet("/delete.rp")
public class ReportDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reportNo = Integer.parseInt(request.getParameter("no"));
		int postNo = Integer.parseInt(request.getParameter("pno"));

		int result = new BoardService().deleteReport(reportNo);
		int result1 = new BoardService().deleteBoard(postNo);
		
		
		
		
		
		if(result > 0 && result1 > 0) {
			request.getSession().setAttribute("alertMsg", "블라인드처리 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.rp");
		}else {
			request.setAttribute("errorMsg", "블라인드처리 실패");
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
