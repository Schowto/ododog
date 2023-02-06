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
import com.odd.order.model.vo.Cart;
import com.odd.product.model.vo.Order;
import com.odd.product.model.vo.Payment;
import com.odd.product.model.vo.Product;
import com.odd.product.model.vo.UserProduct;

/**
 * Servlet implementation class btnBuyController
 */
@WebServlet("/order.pro")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderService();
	private CartService cartService = new CartService();

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
		
		System.out.println(request.getAttribute("proNo0"));
		
		request.getRequestDispatcher("views/order/orderListView.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입력정보
		//String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address1 = request.getParameter("address1");
		String delAdd = request.getParameter("address1"); //데이터 안맞음 확인할 것
		String require = request.getParameter("request");

		Order order = new Order();
		order.setPhone(phone);
		order.setEmail(email);
		order.setDelAdd(""); //비워둠
		order.setAddress(address1);
		order.setRequire(require);


		//적립급
		int point = Integer.valueOf(request.getParameter("point"));
		//결제금액
		int price = Integer.valueOf(request.getParameter("finalPrice"));

		HttpSession session = request.getSession();
		//로그인 여부 검사
		if(session.getAttribute("loginUser") == null) {

			session.setAttribute("alertMsg", "로그인후에 다시 이용해주세요.");
			response.sendRedirect(request.getContextPath());

		}else {
			Member member = (Member) session.getAttribute("loginUser");
			order.setUserNo(member.getUser_No());
			int result = orderService.insertOrder(order);

			if(result > 0) {
				orderService.updatePoint(member, point); //적립금 차감
				cartService.deleteAllCart(member); //장바구니 비움
				session.setAttribute("alertMsg", "주문 성공");
				response.sendRedirect(request.getContextPath()); //해당 링크로 리다이렉트 수정하면됨
//				Payment payment = new Payment();
//				//payment.setOrdNo(); //주문번호 반환되어야 함
//				payment.setDiscount(point);
//				payment.setDelivery(4000);
//				payment.setTotalPrice(price);
		//		result  = orderService.insertPayment();
				//결제 로직
//				if(result > 0) {
//					session.setAttribute("alertMsg", "결제 성공");
//					response.sendRedirect(request.getContextPath()); //해당 링크로 리다이렉트 수정하면됨
//				}else {
//					session.setAttribute("alertMsg", "결제 실패");
//					response.sendRedirect(request.getContextPath()); //해당 링크로 리다이렉트 수정하면됨
//				}

			}else {
				session.setAttribute("alertMsg", "주문 실패");
				response.sendRedirect(request.getContextPath()); //해당 링크로 리다이렉트 수정하면됨
			}

		}





	}

}
