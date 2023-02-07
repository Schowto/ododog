package com.odd.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.odd.member.model.service.MemberService;
import com.odd.member.model.vo.Member;
import com.odd.order.model.service.CartService;
import com.odd.order.model.service.OrderService;
import com.odd.product.model.vo.Product;

/**
 * Servlet implementation class OrderController2
 */
@WebServlet("/order.product")
public class OrderController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderService();
	private CartService cartService = new CartService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] _proNo = request.getParameterValues("proNo");
		String[] _quantity = request.getParameterValues("quantity");
		int[] proNo = {};
		int[] quantity = {};
		List<Product> list = new ArrayList<>();
		//널체크
		if(_proNo != null && _proNo.length > 0) {

			//배열변환
			proNo = new int[_proNo.length];
			for(int i = 0; i < _proNo.length; i++) {
				proNo[i] = Integer.valueOf(_proNo[i]);
			}

		}
		//널체크
		if(_quantity != null && _quantity.length > 0) {

			//배열변환
			quantity = new int[_quantity.length];
			for(int i = 0; i < _quantity.length; i++) {
				quantity[i] = Integer.valueOf(_quantity[i]);
			}

		}

		HttpSession session = request.getSession();
		//로그인 여부 검사
		if(session.getAttribute("loginUser") == null) {

			session.setAttribute("alertMsg", "로그인후에 다시 이용해주세요.");
			response.sendRedirect(request.getContextPath());
			return;

		}else {
			Member member = (Member) session.getAttribute("loginUser");
			member = new MemberService().loginMember(member.getUser_Id(), member.getUser_Pwd());
			int point = member.getPoint();
			list = orderService.selectProductList(proNo);
			request.setAttribute("point", point);

		}

//		int productNo = Integer.parseInt(request.getParameter("no"));
//		UserProduct p = new OrderService().productOrderList(productNo); //UserProduct에 담아놓은 정보들
//
//		request.setAttribute("p", p);
		request.setAttribute("list", list);
		request.setAttribute("quantity", quantity);
		
		request.getRequestDispatcher("views/order/orderListView.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
