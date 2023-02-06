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
import com.odd.member.model.vo.Member;

/**
 * Servlet implementation class MyConsultAnswerController
 */
@WebServlet("/answerInsert.co")
public class MyConsultAnswerFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyConsultAnswerFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		
		int consultNo = Integer.parseInt(request.getParameter("consultNo"));
		String consultAnswer = request.getParameter("consultAnswer");
		
		int result = new ConsultService().consultAnswer(consultNo, consultAnswer);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "답변이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/admin.co");
			
			
		}else {
			request.setAttribute("errorMsg", "답변등록에 실패했습니다.");
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
