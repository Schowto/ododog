package com.odd.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.member.model.service.MemberService;
import com.odd.member.model.vo.Member;

/**
 * Servlet implementation class SearchPwdUpdateController
 */
@WebServlet("/searchUpdate.pwd")
public class SearchPwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_Id = request.getParameter("user_Id");
		String user_Name = request.getParameter("user_Name");
		String email = request.getParameter("email");
		String user_Pwd = request.getParameter("user_Pwd");
		String update_Pwd = request.getParameter("update_Pwd");
		
		Member updatePwd = new MemberService().updatePwdUser(user_Id, user_Name, email, user_Pwd, update_Pwd);
		
		HttpSession session =  request.getSession();
		if(updatePwd == null) {
			session.setAttribute("alertMsg", "변경 실패");
		}else {
			session.setAttribute("alertMsg", "변경 성공");
			session.setAttribute("searchPwd", updatePwd);
			response.sendRedirect(request.getContextPath() + "/views/member/searchPwdResult.jsp");
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
