package com.odd.order.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.member.model.vo.Member;
import com.odd.order.model.service.CartService;
import com.odd.order.model.vo.Cart;
import com.odd.product.model.vo.Product;

/**
 * Servlet implementation class CartInsertController
 */
@WebServlet("/addCart.ord")
public class CartInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private CartService cartService = new CartService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
			response.sendRedirect(request.getContextPath() + "/detail.pro?no=" + proNo);
			
		}else {
		
			int price = Integer.valueOf(request.getParameter("price"));
			int quantity = Integer.valueOf(request.getParameter("quantity"));
			Member member = (Member) session.getAttribute("loginUser");
					
			
			System.out.println("post dodododo" + proNo + price + quantity);
			Cart cart = new Cart();
			
			Product product = new Product();
	
			product.setProNo(proNo);
			product.setPrice(price);
			
			cart.setProduct(product);
			cart.setMember(member);
			
			cart.setCartQty(quantity);
			int cartNo = cartService.selectOneCartNoByUserNo(cart);
			
			//이미 담긴 상품이면 해당 상품에 갯수 추가
			if(cartNo > 0) {
				cart.setCartNo(cartNo);
				int result = cartService.updateCart(cart);
				if(result > 0) {
					response.sendRedirect(request.getContextPath() + "/detail.pro?no=" + proNo + "&state=success");
				}else {
					response.sendRedirect(request.getContextPath() + "/detail.pro?no=" + proNo + "&state=fail");
				}
			
			}else {
				//신규 장바구니 상품 추가
				int result = cartService.insertCart(cart);
				
				if(result > 0) {
					response.sendRedirect(request.getContextPath() + "/detail.pro?no=" + proNo + "&state=success");
				}else {
					response.sendRedirect(request.getContextPath() + "/detail.pro?no=" + proNo + "&state=fail");
				}
				
			}
			
		}
		

	}

}
