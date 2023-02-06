package com.odd.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.member.model.vo.Member;
import com.odd.order.model.service.CartService;
import com.odd.order.model.vo.Cart;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/cart.ord")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//로그인 여부 검사
		if(session.getAttribute("loginUser") == null) {
			
			session.setAttribute("alertMsg", "로그인후에 다시 이용해주세요.");
			response.sendRedirect(request.getContextPath());
			
		}else {
			Member member = (Member) session.getAttribute("loginUser");
			List<Cart> list = cartService.selectCartList(member);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/order/shoppingCartView.jsp").forward(request,response);
			
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
