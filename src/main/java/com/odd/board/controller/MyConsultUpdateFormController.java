package com.odd.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.odd.board.model.service.ConsultService;
import com.odd.board.model.vo.Consult;

/**
 * Servlet implementation class MyConsultUpdateFormController
 */
@WebServlet("/updateForm.co")
public class MyConsultUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyConsultUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int consultNo = Integer.parseInt(request.getParameter("no"));
		
		Consult c = new ConsultService().selectConsult(consultNo);
		
		request.setAttribute("c", c);
		request.getRequestDispatcher("views/board/myConsultUpdateForm.jsp").forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
