package com.odd.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.member.model.vo.Member;
import com.odd.order.model.service.CartService;

/**
 * Servlet implementation class PickDeleteController
 */
@WebServlet("/delPick.ord")
public class PickDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int proNo = Integer.valueOf(request.getParameter("proNo"));
		
		//로그인 여부 검사
		if(session.getAttribute("loginUser") == null) {
			
			session.setAttribute("alertMsg", "로그인후에 다시 이용해주세요.");
			response.sendRedirect(request.getContextPath());
			
		}else {
			Member member = (Member) session.getAttribute("loginUser");
			
			int count = cartService.selectOnePick(member, proNo);
			
			//담긴경우만 삭제처리
			if(count > 0) {
				int result = cartService.deletePick(member, proNo);
				
				if(result > 0) {
					response.sendRedirect(request.getContextPath() + "/detail.pro?no=" + proNo + "&pickState=delSuccess");
				}else {
					response.sendRedirect(request.getContextPath() + "/detail.pro?no=" + proNo + "&pickState=delFail");
				}
			}else {
				response.sendRedirect(request.getContextPath() + "/detail.pro?no=" + proNo + "&pickState=delExist");
			}
			
		}
	}

}
