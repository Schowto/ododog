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

import com.odd.member.model.service.MemberService;
import com.odd.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
	
=======
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		String address = request.getParameter("address");
		String detailedAddress = request.getParameter("detailedAddress");
		
		Member m = new Member(userId, userName, email, phone, postCode, address, detailedAddress);
		
		Member updateMem = new MemberService().updateMember(m);
		
		if(updateMem != null) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원정보수정이 완료되었습니다.");
			request.setAttribute("loginUser", updateMem);
			response.sendRedirect(request.getContextPath() + "/myPage.me");
		}else {
			request.setAttribute("erroPage", "정보수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
>>>>>>> 4b363667b6fbe5f2c33ec5b0ade62334f1e9ff07
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
