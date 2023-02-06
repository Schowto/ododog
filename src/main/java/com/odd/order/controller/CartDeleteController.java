package com.odd.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.order.model.service.CartService;

/**
 * Servlet implementation class CartDeleteController
 */
@WebServlet("/delCart.ord")
public class CartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		int cartNo = Integer.valueOf(request.getParameter("cartNo"));
		HttpSession session = request.getSession();
		
		int result = cartService.deleteCart(cartNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "삭제되었습니다.");
		}else {
			session.setAttribute("alertMsg", "삭제 실패..!");
		}
		response.sendRedirect(request.getContextPath() + "/cart.ord");
	}

}
