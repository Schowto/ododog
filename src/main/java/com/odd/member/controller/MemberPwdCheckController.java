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
 * Servlet implementation class MemberPwdCheckController
 */
@WebServlet("/pwdCheck.me")
public class MemberPwdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		int count = new MemberService().memberPwdCheck(userId, userPwd);
		
		if(count > 0) {
			
			request.getRequestDispatcher("views/member/deleteAccount(2).jsp").forward(request, response);
		
			
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "비밀번호가 틀렸습니다. 다시확인해주세요.");
			response.sendRedirect(request.getContextPath() + "/deleteView.me");
			
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
