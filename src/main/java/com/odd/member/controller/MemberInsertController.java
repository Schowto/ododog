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
 * Servlet implementation class JoinMembershipController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String user_Id = request.getParameter("user_Id");
		String user_Pwd = request.getParameter("user_Pwd");
		String user_Name = request.getParameter("user_Name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int post_Code = Integer.parseInt(request.getParameter("post_Code"));
		String address = request.getParameter("address");
		String detailed_Address = request.getParameter("detailed_Address");
		
		Member m = new Member(user_Id, user_Pwd, user_Name, email, phone, post_Code, address, detailed_Address);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입 성공");
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("errorMsg", "회원가입 실패");
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
