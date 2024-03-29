package com.odd.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.member.model.service.ReviewService;
import com.odd.member.model.vo.Member;
import com.odd.member.model.vo.Review;
import com.odd.order.model.service.CartService;
import com.odd.product.model.service.ProductDetailService;
import com.odd.product.model.vo.ProAtt;
import com.odd.product.model.vo.UserProduct;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/detail.pro")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 응답페이지
		int proNo = Integer.valueOf(request.getParameter("no")); //넘어오는 자손값
		
		ArrayList<ProAtt> list = new ProductDetailService().productDetail(proNo);  //상품상세테이블값
		UserProduct userProduct = new ProductDetailService().productDetailFood(proNo);
		ArrayList<Review> rlist = new ReviewService().selectAllReview(proNo);
		
		HttpSession session = request.getSession();
		
		//로그인 사용자 일경우만 관심상품 상태 조회
		if(session.getAttribute("loginUser") != null) {
			
			Member member = (Member) session.getAttribute("loginUser");
			
			int count = cartService.selectOnePick(member, proNo);
			request.setAttribute("count", count);
			
		}
		
		request.setAttribute("list", list);
		request.setAttribute("p", userProduct);
		request.setAttribute("rlist", rlist);
		request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
