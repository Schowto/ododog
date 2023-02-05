package com.odd.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.odd.board.model.service.ConsultService;
import com.odd.board.model.vo.Consult;
import com.odd.common.MyFileRenamePolicy;

/**
 * Servlet implementation class MyConsultAnswerController
 */
@WebServlet("/answer.co")
public class MyConsultAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyConsultAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int consultNo = Integer.parseInt(request.getParameter("consultNo"));
		
		Consult c = new ConsultService().selectConsult(consultNo);
		
		request.setAttribute("c", c);
		
		request.getRequestDispatcher("views/board/adminConsultAnswerForm.jsp").forward(request,response);
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
