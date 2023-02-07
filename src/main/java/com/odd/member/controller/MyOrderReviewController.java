package com.odd.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.member.model.service.ReviewService;
import com.odd.product.model.vo.Product;

/**
 * Servlet implementation class MyOrderReviewController
 */
@WebServlet("/review.me")
public class MyOrderReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 상품번호 받아오기
		//MyOrder ordNo = new MyOrderService().selectreviewNo(상품번호);
		
		// TB_ORDER테이블에서 주문번호 받아오기
		//int ordNo = Integer.parseInt(request.getParameter("ordNo"));
		
		//MyOrder m = new MyOrderService().selectMyOrder(ordNo);
		
		//request.setAttribute("m", m);
		
		int proNo = Integer.parseInt(request.getParameter("no"));
		
		HttpSession session = request.getSession();
		
		Product p = new ReviewService().reviewProduct(proNo);
		
		request.setAttribute("p", p);
		
		request.getRequestDispatcher("views/member/myOrderReviewForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
